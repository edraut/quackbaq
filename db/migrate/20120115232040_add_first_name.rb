class AddFirstName < ActiveRecord::Migration
  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :login, :string
    add_column :users, :status, :string
    add_column :users, :income, :string
  end

  def self.down
    remove_column :users, :income
    remove_column :users, :status
    remove_column :users, :login
    remove_column :users, :last_name
    remove_column :users, :first_name
  end
end