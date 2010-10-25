class CreateAuctions < ActiveRecord::Migration
  def self.up
    create_table :auctions, :force => true do |t|
      t.integer   :item_id
      t.string    :type
      t.datetime  :begin_time
      t.datetime  :end_time
      t.integer   :opening_bid
      t.string    :state
      t.timestamps
    end
  end

  def self.down
    drop_table :auctions
  end
end
