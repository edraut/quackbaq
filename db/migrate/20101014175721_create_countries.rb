class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table "countries", :force => true do |t|
      t.string   "iso"
      t.string   "name"
      t.string   "printable_name"
      t.string   "iso3"
      t.integer  "numcode"
      t.integer  "position"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :countries
  end
end
