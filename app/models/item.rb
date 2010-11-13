class Item < ActiveRecord::Base
  #constants
  
  #associations
  has_many :auctions
  #named_scopes
  scope :primary, :conditions => {:parent_id => nil}
  #special behaviors
  composed_of :full_price, :class_name => 'Money', :mapping => [%w(full_price cents)]
  composed_of :shipping_cost, :class_name => 'Money', :mapping => [%w(shipping_cost cents)]

  #validations
  
  #callbacks
  
  #class methods
  
  #instance methods
  
end