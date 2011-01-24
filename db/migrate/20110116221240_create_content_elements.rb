class CreateContentElements < ActiveRecord::Migration
  def self.up
    create_table :content_elements, :force => true do |t|
      t.integer  "container_id",       :limit => 11
      t.string   "container_type"
      t.string   "type",               :limit => 25
      t.text     "body"
      t.string   "image_file_name"
      t.string   "image_content_type"
      t.string   "video_url"
      t.integer  "position",           :limit => 11
      t.datetime "created_at"
      t.datetime "updated_at"
      t.boolean  "processing", :default => false, :null => false
    end
  end

  def self.down
    drop_table :content_elements
  end
end