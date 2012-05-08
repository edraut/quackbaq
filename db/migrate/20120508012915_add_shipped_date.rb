class AddShippedDate < ActiveRecord::Migration
  def up
    add_column :auctions, :shipped_on, :date
  end

  def down
    remove_column :auctions, :shipped_on
  end
end
