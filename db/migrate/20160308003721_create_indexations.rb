class CreateIndexations < ActiveRecord::Migration
  def change
    create_table :indexations do |t|
      t.integer :keyword_id
      t.integer :appreciation_id
      t.integer :hit
      t.datetime :created_at

      t.timestamps null: false
    end
  end
end
