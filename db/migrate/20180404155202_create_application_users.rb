class CreateApplicationUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :application_users do |t|
      t.string :name, null: false
      t.string :login, null: false
      t.string :password, null: false
      t.string :token, null: false

      t.references :company, null: false, foreign_key: true, index: true

      t.datetime :last_sign_in_at
      t.datetime :last_sign_out_at
      t.timestamps
    end
  end
end
