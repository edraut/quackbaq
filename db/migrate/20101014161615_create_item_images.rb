class CreateItemImages < ActiveRecord::Migration
  def self.up
    create_table :item_images, :force => true do |t|
      t.integer :item_id
      t.integer :category_id
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.integer :position
      t.timestamps
    end
    
    add_index "item_images", "item_id", :name => "index_bids_on_item_id"
    add_index "item_images", "category_id", :name => "index_bids_on_category_id"
    
  end

  def self.down
    drop_table :item_images
  end
end
