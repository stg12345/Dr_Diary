class SetDefaultVisibilityDiary < ActiveRecord::Migration
  def change
    change_column_default :diaries, :visibility, true
  end
end
