class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids, :force => true do |t|
      t.integer     :user_id
      t.integer     :placed_auction_id
      t.integer     :only_for_auction_id
      t.datetime    :placed_at
      t.integer     :price_paid
      t.datetime    :bought_at
    end
    add_index "bids", "user_id", :name => "index_bids_on_user_id"
    add_index "bids", "placed_auction_id", :name => "index_bids_on_placed_auction_id"
    
  end

  def self.down
    drop_table :bids
  end
end
