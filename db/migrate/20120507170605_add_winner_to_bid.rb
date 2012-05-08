class AddWinnerToBid < ActiveRecord::Migration
  def self.up
    add_column :bids, :winner, :boolean, :default => false
  end
  def self.down
    remove_column :bids, :winner
  end
end
