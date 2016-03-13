class CreateAppreciations < ActiveRecord::Migration
  def change
    create_table :appreciations do |t|
      t.text :content
      t.string :remark
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
