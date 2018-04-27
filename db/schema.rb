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

ActiveRecord::Schema.define(version: 20180426173505) do

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

  create_table "company_owners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.bigint "company_id", null: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_owners_on_company_id"
    t.index ["email"], name: "index_company_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_company_owners_on_reset_password_token", unique: true
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

  create_table "work_on_operations", force: :cascade do |t|
    t.bigint "operation_id", null: false
    t.bigint "application_user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "ended_at"
    t.index ["application_user_id"], name: "index_work_on_operations_on_application_user_id"
    t.index ["operation_id"], name: "index_work_on_operations_on_operation_id"
  end

  add_foreign_key "application_users", "companies"
  add_foreign_key "company_owners", "companies"
  add_foreign_key "operations", "orders"
  add_foreign_key "orders", "companies"
  add_foreign_key "work_on_operations", "application_users"
  add_foreign_key "work_on_operations", "operations"
end
