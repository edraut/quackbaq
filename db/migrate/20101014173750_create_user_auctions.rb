class CreateUserAuctions < ActiveRecord::Migration
  def self.up
    create_table :user_auctions, :force => true do |t|
      t.integer     :user_id
      t.integer     :auction_id
    end
    add_index "user_auctions", "user_id", :name => "index_user_auctions_on_user_id"
    add_index "user_auctions", "auction_id", :name => "index_user_auctions_on_auction_id"
  end

  def self.down
    drop_table :user_auctions
  end
end
