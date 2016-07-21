class AddProfilePictureToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_profile_picture, :string
  end
end
