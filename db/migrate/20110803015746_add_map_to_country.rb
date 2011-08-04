class AddMapToCountry < ActiveRecord::Migration
  def self.up
    add_column :countries, :map, :integer
  end

  def self.down
    remove_column :countries, :map
  end
end