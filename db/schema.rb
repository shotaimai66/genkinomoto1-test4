# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 10) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "store_id"
    t.string "name"
    t.string "description"
    t.integer "price"
    t.integer "stock"
    t.datetime "purchasing_date"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "cart_id", null: false
    t.integer "quantity"
    t.datetime "paid_at"
    t.integer "payment_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["item_id"], name: "index_orders_on_item_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.integer "subtotal"
    t.integer "tax"
    t.integer "shipping_fee"
    t.integer "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_payments_on_cart_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "store_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "title_for_guest"
    t.string "title_for_staff"
    t.integer "course", default: 0
    t.integer "status", default: 0
    t.string "comment"
    t.integer "staff_id"
    t.integer "guest_id"
    t.datetime "reservation_time"
    t.boolean "holiday_flag", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "authority"
    t.string "name"
    t.string "kana"
    t.integer "sex"
    t.datetime "birthday"
    t.string "address"
    t.datetime "enter_date"
    t.datetime "exit_date"
    t.boolean "flag", default: false
    t.bigint "store_id"
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_staffs_on_store_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name", default: "", null: false
    t.string "kana"
    t.integer "sex"
    t.datetime "birthday"
    t.datetime "enter_date"
    t.datetime "exit_date"
    t.boolean "flag", default: false, null: false
    t.string "provider"
    t.string "uid"
    t.integer "postal_code"
    t.string "prefecture_code"
    t.string "city"
    t.string "street"
    t.string "other_address"
    t.bigint "store_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["store_id"], name: "index_users_on_store_id"
  end

  add_foreign_key "carts", "users"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "items"
  add_foreign_key "payments", "carts"
  add_foreign_key "staffs", "stores"
  add_foreign_key "users", "stores"
end
