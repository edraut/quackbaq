class CreateAddress < ActiveRecord::Migration
  def self.up
    create_table :addresses, :force => true do |t|
      t.string      :type
      t.integer     :user_id
      t.string      :address1
      t.string      :address2
      t.string      :state
      t.integer     :country_id
      t.string      :zipcode
    end
    add_index "addresses", "user_id", :name => "index_addresses_on_user_id"
    
  end

  def self.down
    drop_table :addresses
  end
end
