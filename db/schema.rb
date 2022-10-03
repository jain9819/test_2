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

ActiveRecord::Schema[7.0].define(version: 2022_09_03_100656) do
  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "reply_id"
  end

  create_table "likes", charset: "utf8mb3", force: :cascade do |t|
    t.integer "likeable_id"
    t.string "likeable_type"
    t.integer "like_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["likeable_id"], name: "index_likes_on_likeable_id"
    t.index ["likeable_type"], name: "index_likes_on_likeable_type"
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "product_id"
    t.string "order_type"
    t.integer "quantity"
    t.float "net_price"
    t.float "discount"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
  end

  create_table "products", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "mob_no"
    t.date "dob"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
