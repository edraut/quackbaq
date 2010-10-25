class CreateAccessories < ActiveRecord::Migration
  def self.up
    create_table :accessories, :force => true do |t|
      t.integer       :item_id
      t.string        :name
      t.text          :description
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.timestamps
    end
    add_index "accessories", "item_id", :name => "index_accessories_on_item_id"
  end

  def self.down
    drop_table :accessories
  end
end
