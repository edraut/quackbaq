class User < ActiveRecord::Base
  #constants
  TYPES = [
    {:name => 'Customer', :id => 'Customer'},
    {:name => 'Admin', :id => 'Admin'}
  ]
  #accessors
  attr_accessor :cim_profile
  
  #associations
  has_one :billing_address, :dependent => :destroy, :foreign_key => 'user_id'
  has_many :bids, :dependent => :destroy
  has_many :user_auctions, :dependent => :destroy
  has_many :auctions, :through => :user_auctions
  
  #special behaviors
  acts_as_authentic
  
  state_machine :state, :initial => :not_valid do
    event :validate_account do
      transition :not_valid => :active
    end
    event :deactivate do
      transition :active => :inactive
    end
    state :not_valid
    state :active
    state :inactive
  end
  #validations
  validates_presence_of :name
  #callbacks
  
  #class methods
  
  #instance methods
  
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
  
  ############################################################################################
  ########### Begin CIM methods, copyright 2008 Eric Draut, all rights reserved ##############
  ############################################################################################

    def add_credit_card(card_hash)
      self.cim_id ||= get_new_cim_id
      if self.cim_id.blank?
        return false
      else
        credit_card = ActiveMerchant::Billing::CreditCard.new(
          :number => card_hash[:number].gsub(/[\s-]/,''),
          :first_name => card_hash[:first_name],
          :last_name => card_hash[:last_name],
          :month => card_hash[:month],
          :year => card_hash[:year],
          :verification_value => card_hash[:cvv],            
          :type => ActiveMerchant::Billing::CreditCard.type?(card_hash[:number])
        )
        gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new( :login => AUTH_NET_LOGIN, :password => AUTH_NET_TRANS_ID )
        response = gateway.create_customer_payment_profile(:customer_profile_id => self.cim_id,:payment_profile => {:payment => {:credit_card => credit_card}, :bill_to => {:first_name => self.billing_address.first_name, :last_name => self.billing_address.last_name, :address => (self.billing_address.address_1 + self.billing_address.address_2), :city => self.billing_address.city, :state => self.billing_address.state, :zip => self.billing_address.zipcode, :country => self.billing_address.country.iso}},:validation_mode => :live)
        if response.message != 'Successful.'
          handle_errors(response)
          self.errors.add_to_base("*When attempting to add your card, we got this response from our processor:*<br/> *#{response.message}*<br/> *Please double-check the information you entered, or try using another credit card.*")
        else
          self.card_valid = true
          self.save
        end
      end
    end

    def remove_credit_card
      if self.cim_id.blank? or self.cim_payment_profile_id.blank?
        return false
      else
        gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new( :login => AUTH_NET_LOGIN, :password => AUTH_NET_TRANS_ID )
        response = gateway.delete_customer_payment_profile(:customer_profile_id => self.cim_id,:customer_payment_profile_id => self.cim_payment_profile_id)
        if response.message == 'Successful.'
          self.card_valid = false
          self.save
        else
          handle_errors(response)
        end
      end
    end

    def get_new_cim_id
      gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new( :login => AUTH_NET_LOGIN, :password => AUTH_NET_TRANS_ID )
      response = gateway.create_customer_profile(:profile => {:email => self.email, :merchant_customer_id => self.id})
      if response.message == 'Successful.'
        self.cim_id = response.params['customer_profile_id']
        self.save
      else
        handle_errors(response)
        self.errors.add_to_base("We were unable to contact our secure storage facility, we could not store your credit card info.")
      end
      self.cim_id
    end

    def get_cim_profile
      unless @cim_profile
        refresh_cim_profile
      end
      @cim_profile
    end

    def refresh_cim_profile
      gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new( :login => AUTH_NET_LOGIN, :password => AUTH_NET_TRANS_ID )
      @cim_profile = gateway.get_customer_profile(:customer_profile_id => self.cim_id)
    end

    def cim_payment_profile_id
      if get_cim_profile and get_cim_profile.params.has_key? 'profile' and get_cim_profile.params['profile'].has_key? 'payment_profiles' and get_cim_profile.params['profile']['payment_profiles'].has_key? 'customer_payment_profile_id'
        get_cim_profile.params['profile']['payment_profiles']['customer_payment_profile_id']
      else
        nil
      end
    end

    def card_last_four
      if get_cim_profile and cim_payment_profile_id
        masked_card_number = self.get_cim_profile.params['profile']['payment_profiles']['payment']['credit_card']['card_number']
        return masked_card_number.gsub(/X/,'')
      else
        nil
      end
    end

    def handle_errors(response)
      if response.params['messages']['message']['code'] == 'E00007'
        # handle invalid auth.net login/transaction id error here.
      end
    end

    ###########################################
    ############ End CIM Methods ##############
    ###########################################

end