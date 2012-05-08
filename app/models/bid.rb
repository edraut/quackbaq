class Bid < ActiveRecord::Base
  #constants
  #associations
  belongs_to :placed_auction, :class_name => 'Auction', :foreign_key => 'placed_auction_id'
  belongs_to :only_for_auction, :class_name => 'Auction', :foreign_key => 'only_for_auction_id'
  belongs_to :user
  #named_scopes
  scope :placed, where("placed_at is not null")
  scope :available, where("placed_at is null")
  scope :new_to_old, order("placed_at desc")
  scope :placed_by, lambda{ |user| where(:user_id => user.id)}
  scope :winners, where(:winner => true)
  #special behaviors
  composed_of :price_paid, :class_name => 'Money', :mapping => [%w(price_paid cents)]
  composed_of :amount, :class_name => 'Money', :mapping => [%w(amount cents)]

  #validations
  
  #callbacks
  
  #class methods
  
  #instance methods
end