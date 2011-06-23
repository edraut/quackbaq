class AddImageToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :image_file_name, :string
    add_column :categories, :image_content_type, :string
  end

  def self.down
    remove_column :categories, :image_content_type
    remove_column :categories, :image_file_name
  end
end