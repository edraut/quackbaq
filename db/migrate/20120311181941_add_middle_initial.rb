class AddMiddleInitial < ActiveRecord::Migration
  def up
  	add_column :users, :middle_initial, :string
  	add_column :users, :screen_name, :string
  end

  def down
    remove_column :users, :middle_initial
    remove_column :users, :screen_name
  end
end
