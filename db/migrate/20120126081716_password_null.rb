class PasswordNull < ActiveRecord::Migration
  def up
    change_column :users, :crypted_password, :string, :null => true
    change_column :users, :password_salt, :string, :null => true
  end

  def down
  end
end