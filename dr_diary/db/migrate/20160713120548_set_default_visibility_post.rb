class SetDefaultVisibilityPost < ActiveRecord::Migration
  def change
    change_column_default :posts, :visibility, true
  end
end
