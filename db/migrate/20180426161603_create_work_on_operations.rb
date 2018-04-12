class CreateWorkOnOperations < ActiveRecord::Migration[5.1]
  def change
    create_table :work_on_operations do |t|
      t.references :operation, null: false, foreign_key: true, index: true
      t.references :application_user, null: false, foreign_key: true, index: true

      t.timestamps
      t.datetime :ended_at
    end
  end
end
