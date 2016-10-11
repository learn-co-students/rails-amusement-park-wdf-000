class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :attractions, :min_heights, :min_height
  end
end
