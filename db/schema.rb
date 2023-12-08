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

ActiveRecord::Schema[7.1].define(version: 2023_12_07_145729) do
# Could not dump table "availabilities" because of following StandardError
#   Unknown type 'id' for column 'alloted_to'

  create_table "markets", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.string "contact"
    t.string "email"
    t.integer "repair_type_id", null: false
    t.integer "market_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_mechanics_on_market_id"
    t.index ["repair_type_id"], name: "index_mechanics_on_repair_type_id"
  end

  create_table "repair_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_repair_types_on_name", unique: true
  end

  create_table "repairs", force: :cascade do |t|
    t.integer "mechanic_id", null: false
    t.integer "repair_type_id", null: false
    t.integer "subscription_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "scheduled_at"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mechanic_id"], name: "index_repairs_on_mechanic_id"
    t.index ["repair_type_id"], name: "index_repairs_on_repair_type_id"
    t.index ["subscription_id"], name: "index_repairs_on_subscription_id"
    t.index ["vehicle_id"], name: "index_repairs_on_vehicle_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
    t.index ["vehicle_id"], name: "index_subscribers_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.integer "market_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id"], name: "index_vehicles_on_market_id"
  end

  create_table "weekly_schedules", force: :cascade do |t|
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availabilities", "mechanics"
  add_foreign_key "mechanics", "markets"
  add_foreign_key "mechanics", "repair_types"
  add_foreign_key "repairs", "mechanics"
  add_foreign_key "repairs", "repair_types"
  add_foreign_key "repairs", "subscriptions"
  add_foreign_key "repairs", "vehicles"
  add_foreign_key "subscribers", "vehicles"
  add_foreign_key "vehicles", "markets"
end
