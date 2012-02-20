class ChangeAddressFields < ActiveRecord::Migration
  def up
    add_column :addresses, :first_name, :string
    add_column :addresses, :middle_initial, :string
    add_column :addresses, :last_name, :string
    add_column :addresses, :city, :string
    add_column :addresses, :phone, :string
    add_column :addresses, :email, :string
    add_column :addresses, :company_c_o, :string
  end

  def down
    remove_column :addresses, :first_name
    remove_column :addresses, :middle_initial
    remove_column :addresses, :last_name
    remove_column :addresses, :city
    remove_column :addresses, :phone
    remove_column :addresses, :email
    remove_column :addresses, :company_c_o, :string
  end
end