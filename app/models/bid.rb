class Bid < ActiveRecord::Base
  #constants
  #associations
  belongs_to :placed_auction, :class_name => 'Auction', :foreign_key => 'placed_auction_id'
  belongs_to :only_for_auction, :class_name => 'Auction', :foreign_key => 'only_for_auction_id'
  belongs_to :user
  #named_scopes
  scope :placed, :conditions => "placed_at is not null"
  scope :available, :conditions => "placed_at is null"
  
  #special behaviors
  composed_of :price_paid, :class_name => 'Money', :mapping => [%w(price_paid cents)]

  #validations
  
  #callbacks
  
  #class methods
  
  #instance methods
end