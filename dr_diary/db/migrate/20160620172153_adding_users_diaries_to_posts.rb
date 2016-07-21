class AddingUsersDiariesToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user, index: true, foreign_key: true
    add_reference :posts, :diary, index: true, foreign_key: true
  end
end
