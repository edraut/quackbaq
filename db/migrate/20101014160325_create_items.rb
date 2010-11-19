class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items, :force => true do |t|
      t.string      :name
      t.integer     :full_price, :null => false, :default => 0
      t.text        :description
      t.integer     :shipping_cost, :null => false, :default => 0
      t.string      :type
      t.integer     :parent_id
    end
  end

  def self.down
    drop_table :items
  end
end
