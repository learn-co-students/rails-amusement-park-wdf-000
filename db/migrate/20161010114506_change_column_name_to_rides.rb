class ChangeColumnNameToRides < ActiveRecord::Migration
  def change
    rename_column :rides, :attaction_id, :attraction_id
  end
end
