class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers, :force => true, :id =>false  do |t|
      t.integer "user_id", :null => false
      t.integer "follower_id", :null => false      
      t.timestamps null: false
    end
  end
end
