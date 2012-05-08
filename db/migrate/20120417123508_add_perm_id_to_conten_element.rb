class AddPermIdToContenElement < ActiveRecord::Migration
  def self.up
    add_column :content_elements, :permanent_id, :integer
  end
  def self.down
    remove_column :content_elements, :permanent_id
  end
end
