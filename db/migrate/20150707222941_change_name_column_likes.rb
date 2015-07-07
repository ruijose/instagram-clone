class ChangeNameColumnLikes < ActiveRecord::Migration
  def change
    rename_column :likes, :likes_id, :who_liked_id
    rename_column :likes, :liked_id, :liked_pics_id
  end
end
