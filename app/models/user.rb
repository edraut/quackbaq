class User < ActiveRecord::Base
  #constants
  TYPES = [
    {:name => 'Customer', :id => 'Customer'},
    {:name => 'Admin', :id => 'Admin'}
  ]
  #accessors
  attr_accessor :cim_profile
  attr_accessor :step
  
  #associations
  has_one :billing_address, :dependent => :destroy, :foreign_key => 'user_id'
  has_one :shipping_address, :dependent => :destroy, :foreign_key => 'user_id'
  has_many :bids, :dependent => :destroy
  has_many :user_auctions, :dependent => :destroy
  has_many :auctions, :through => :user_auctions
  belongs_to :generic_avatar
  
  #special behaviors
  acts_as_authentic do |u|
    u.login_field = :email
    u.ignore_blank_passwords = true
    u.merge_validates_length_of_password_field_options({:if => :should_validate_password, :minimum => 7})
  end
  
  state_machine :state, :initial => :blank_slate, :action => nil do
    event :finish_one do
      transition :blank_slate => :step_one
    end
    event :finish_two do
      transition :step_one => :step_two
    end
    event :finish_sign_up do
      transition :step_two => :active
    end
    event :deactivate do
      transition :active => :inactive
    end
    state :blank_slate do
      def next_action
        'finish_one'
      end
    end
    state :step_one do
      def next_sign_up_step
        2
      end
      def next_action
        'finish_two'
      end
    end
    state :step_two do
      def next_sign_up_step
        3
      end
      def next_action
        'finish_sign_up'
      end
    end
    state :active
    state :inactive
  end

  accepts_nested_attributes_for :billing_address, :shipping_address

  #validations
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_with UserValidator
  #callbacks
  #class methods
  
  #instance methods
  
  def joined?
    self.active? or self.inactive?
  end
  
  def map_number
    if (['US','CA'].include? self.billing_address.country.iso)
      return Address.map_for(self.billing_address.state)
    else
      return self.billing_address.country.map
    end
  end
  
  def prepare_for_validation
    self.reset_perishable_token!
    Notifier.account_validation_instructions(self).deliver
  end

  def prepare_password_reset
    self.reset_perishable_token!  
    Notifier.password_reset_instructions(self).deliver
  end 

  def should_validate_password
    Rails.logger.info("should validate password? #{self.step_one?}")
    self.step_one?
  end
  
end