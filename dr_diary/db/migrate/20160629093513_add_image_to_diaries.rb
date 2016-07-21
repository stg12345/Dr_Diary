class AddImageToDiaries < ActiveRecord::Migration
  def change
    add_column :diaries, :diary_image, :string
  end
end
