class CreateGenericAvatars < ActiveRecord::Migration
  def change
    create_table :generic_avatars do |t|
      t.string :name
      t.string :image_file_name

      t.timestamps
    end
  end
end
