class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    t.string :title, :limit =>35
    t.text :content
    t.boolean :visibility
      t.timestamps null: false
    end
  end
end
