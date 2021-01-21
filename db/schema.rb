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

ActiveRecord::Schema.define(version: 2021_01_20_101308) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_unsubscribed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "dish_foodstuffs", force: :cascade do |t|
    t.integer "master_dish_id"
    t.integer "foodstuff_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_dish_id"], name: "index_dish_foodstuffs_on_master_dish_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "master_dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foodstuffs", force: :cascade do |t|
    t.string "category_id"
    t.string "name"
    t.string "image_id"
    t.float "calory"
    t.float "protein"
    t.float "carbohydrate"
    t.float "fat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "master_dishes", force: :cascade do |t|
    t.integer "foodstuff_id"
    t.integer "genre_id"
    t.string "name"
    t.string "image_id"
    t.text "recipe"
    t.integer "count"
    t.integer "total_calory", default: 0
    t.integer "total_fat", default: 0
    t.integer "total_carbohydrate", default: 0
    t.integer "total_protein", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_master", default: true
    t.integer "customer_id"
  end

  create_table "master_menu_recipes", force: :cascade do |t|
    t.integer "master_menu_id"
    t.integer "master_dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "amount"
    t.index ["master_menu_id"], name: "index_master_menu_recipes_on_master_menu_id"
  end

  create_table "master_menus", force: :cascade do |t|
    t.integer "master_dish_id"
    t.integer "menu_genre_id"
    t.string "name"
    t.string "image_id"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_master", default: true
    t.integer "customer_id"
  end

  create_table "menu_genres", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "customer_id"
    t.integer "master_dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
