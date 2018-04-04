class CreateOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :operations do |t|
      t.string :key, null: false
      t.text :description
      t.integer :estimated_time, null: false

      t.references :order, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
