class CreateUsers < ActiveRecord::Migration
  # Write your migrations here
  def change
    create_table :users do |t|
      t.string :name
      t.integer :tickets
      t.integer :nausea
      t.integer :happiness
      t.integer :height
    end
  end
end
