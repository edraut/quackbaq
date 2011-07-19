class Item < ActiveRecord::Base
  #constants
  
  #associations
  belongs_to :category
  has_many :auctions, :dependent => :destroy
  has_many :content_elements, :as => :container, :dependent => :destroy, :order => 'position'
  has_many :content_images, :as => :container, :order => 'position'
  has_many :content_videos, :as => :container, :order => 'position'
  has_many :content_texts, :as => :container, :order => 'position'
  #named_scopes
  scope :primary, :conditions => {:parent_id => nil}
  #special behaviors
  composed_of :full_price, :class_name => 'Money', :mapping => [%w(full_price cents)]
  composed_of :shipping_cost, :class_name => 'Money', :mapping => [%w(shipping_cost cents)]

  #validations
  validates_presence_of :name
  
  #callbacks
  
  #class methods
  
  #instance methods
  
end