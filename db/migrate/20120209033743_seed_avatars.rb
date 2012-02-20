class SeedAvatars < ActiveRecord::Migration
  def up
    50.times do |i|
      GenericAvatar.create(:name => i.to_s)
    end
  end

  def down
    50.times do |i|
      GenericAvatar.find_by_name(i.to_s).destroy
    end
  end
end
