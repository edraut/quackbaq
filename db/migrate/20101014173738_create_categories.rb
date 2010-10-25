class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories, :force => true do |t|
      t.string      :name
      t.integer     :parent_id
      t.integer     :position
    end
    add_index "categories", "parent_id", :name => "index_categories_on_parent_id"
    
  end

  def self.down
    drop_table :categories
  end
end
