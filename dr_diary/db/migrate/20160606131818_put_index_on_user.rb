class PutIndexOnUser < ActiveRecord::Migration
  def up
     add_index("users","username")
    add_index("users","id")
  end
  def down
     remove_index("users","username")
    remove_index("users","id")
  end
end
