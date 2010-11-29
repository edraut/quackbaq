class Auction < ActiveRecord::Base
  #constants
  TYPES = [
    {:name => 'Classic', :id => 'ClassicAuction'},
    {:name => 'Quacktion', :id => 'Quacktion'},
    {:name => 'Lightning', :id => 'LightningAuction'}
  ]

  #associations
  belongs_to :item
  has_many :placed_bids, :class_name => 'Bid', :foreign_key => 'placed_auction_id'
  #named_scopes
  #special behaviors
  #validations
  
  #callbacks
  after_create :create_channel
  #class methods
  
  #instance methods
  
  def current_price
    self.item.full_price - Money.new(self.placed_bids.count)
  end
  
  def channel_name
    'auction_' + self.id.to_s
  end
  
  def create_channel
    Nestful.get("#{HOOKBOX_URL}/web/create_channel", :params => {:security_token => 'secret', :channel_name => self.channel_name, :history_size => 5})
  end
end