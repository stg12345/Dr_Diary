class CreateDiaries < ActiveRecord::Migration
  def change
    create_table :diaries do |t|
      t.string :name, :limit=>25
      t.string :visibility
     
      t.timestamps null: false
    end
    
  end
end
