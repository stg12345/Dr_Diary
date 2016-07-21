class AddPicturesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_pictures, :text
  end
end
