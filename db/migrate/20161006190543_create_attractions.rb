class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :name
      t.integer :tickets
      t.integer :happiness_rating
      t.integer :min_height
      t.integer :nausea_rating

      t.timestamps null: false
    end
  end
end
