class AddAmountToBid < ActiveRecord::Migration
  def self.up
    add_column :bids, :amount, :integer
  end
  def self.down
    remove_column :bids, :amount
  end
end
