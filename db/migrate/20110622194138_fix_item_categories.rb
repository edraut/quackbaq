class FixItemCategories < ActiveRecord::Migration
  def self.up
    add_column :items, :category_id, :integer
    remove_column :item_images, :category_id
  end

  def self.down
    add_column :item_images, :category_id, :integer
    remove_column :items, :category_id
  end
end
