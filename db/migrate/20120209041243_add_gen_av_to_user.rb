class AddGenAvToUser < ActiveRecord::Migration
  def change
    add_column :users, :generic_avatar_id, :integer
  end
end