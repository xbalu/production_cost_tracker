# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180426161551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_users", force: :cascade do |t|
    t.string "name", null: false
    t.string "login", null: false
    t.string "password", null: false
    t.string "token", null: false
    t.bigint "company_id", null: false
    t.datetime "last_sign_in_at"
    t.datetime "last_sign_out_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_application_users_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string "key", null: false
    t.text "description"
    t.integer "estimated_time", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_operations_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "key", null: false
    t.text "description"
    t.integer "amount"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_orders_on_company_id"
  end

  add_foreign_key "application_users", "companies"
  add_foreign_key "operations", "orders"
  add_foreign_key "orders", "companies"
end
