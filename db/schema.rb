# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110125215539) do

  create_table "addresses", :force => true do |t|
    t.string  "type"
    t.integer "user_id"
    t.string  "address1"
    t.string  "address2"
    t.string  "state"
    t.integer "country_id"
    t.string  "zipcode"
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "auctions", :force => true do |t|
    t.integer  "item_id"
    t.string   "type"
    t.datetime "begin_time"
    t.datetime "end_time"
    t.integer  "opening_bid"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bids", :force => true do |t|
    t.integer  "user_id"
    t.integer  "placed_auction_id"
    t.integer  "only_for_auction_id"
    t.datetime "placed_at"
    t.integer  "price_paid"
    t.datetime "created_at"
  end

  add_index "bids", ["placed_auction_id"], :name => "index_bids_on_placed_auction_id"
  add_index "bids", ["user_id"], :name => "index_bids_on_user_id"

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.integer "parent_id"
    t.integer "position"
  end

  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "content_elements", :force => true do |t|
    t.integer  "container_id"
    t.string   "container_type"
    t.string   "type",               :limit => 25
    t.text     "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.string   "video_url"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "processing",                       :default => false, :null => false
  end

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

  create_table "item_images", :force => true do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_images", ["category_id"], :name => "index_bids_on_category_id"
  add_index "item_images", ["item_id"], :name => "index_bids_on_item_id"

  create_table "items", :force => true do |t|
    t.string  "name"
    t.integer "full_price"
    t.text    "description"
    t.integer "shipping_cost"
    t.string  "type"
    t.integer "parent_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "template"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_auctions", :force => true do |t|
    t.integer "user_id"
    t.integer "auction_id"
  end

  add_index "user_auctions", ["auction_id"], :name => "index_user_auctions_on_auction_id"
  add_index "user_auctions", ["user_id"], :name => "index_user_auctions_on_user_id"

  create_table "user_items", :force => true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "shipped_at"
    t.integer  "auction_id"
    t.string   "type"
    t.string   "state"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                     :null => false
    t.string   "crypted_password",                          :null => false
    t.string   "password_salt",                             :null => false
    t.string   "persistence_token",                         :null => false
    t.string   "name"
    t.string   "type"
    t.string   "membership_level"
    t.string   "state",               :default => "active", :null => false
    t.integer  "login_count",         :default => 0,        :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "single_access_token",                       :null => false
    t.string   "perishable_token",                          :null => false
    t.integer  "failed_login_count",  :default => 0,        :null => false
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.integer  "quackstars"
    t.string   "cim_id"
    t.boolean  "card_valid"
    t.string   "age_bracket"
    t.string   "cell_phone"
    t.string   "contact_phone"
    t.boolean  "terms_accepted"
    t.string   "how_hear"
    t.string   "how_hear_other"
    t.string   "gender"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
