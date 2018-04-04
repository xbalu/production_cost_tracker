class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :key, null: false
      t.text :description
      t.integer :amount

      t.references :company, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
