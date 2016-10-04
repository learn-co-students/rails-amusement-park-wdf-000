class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :nausea
      t.integer :happines
      t.integer :tickets
      t.integer :height
      t.boolean :admin,  default: false

      t.timestamps null: false
    end
  end
end
