class Auction < ActiveRecord::Base
  TYPES = [
    {:name => 'Classic', :id => 'ClassicAuction'},
    {:name => 'Quacktion', :id => 'Quacktion'},
    {:name => 'Lightning', :id => 'LightningAuction'}
  ]

  belongs_to :item
end