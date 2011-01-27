class FixCellPhone < ActiveRecord::Migration
  def self.up
    change_column :users, :cell_phone, :string
  end

  def self.down
    change_column :users, :cell_phone, :string
  end
end