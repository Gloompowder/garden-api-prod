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

ActiveRecord::Schema[7.2].define(version: 2025_03_09_061057) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gardens", force: :cascade do |t|
    t.integer "assemblydist"
    t.string "address"
    t.string "borough"
    t.integer "communityboard"
    t.integer "congressionaldist"
    t.integer "coundist"
    t.string "gardenname"
    t.string "juris"
    t.string "multipolygon"
    t.string "openhrsf"
    t.string "openhrsm"
    t.string "openhrssa"
    t.string "openhrssu"
    t.string "openhrsth"
    t.string "openhrstu"
    t.string "openhrsw"
    t.string "parksid"
    t.string "policeprecinct"
    t.integer "statesenatedist"
    t.string "status"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "lastupdate"
    t.datetime "scheduled_start"
    t.datetime "scheduled_end"
    t.datetime "time_in"
    t.datetime "time_out"
    t.datetime "actual_arrival"
    t.datetime "actual_departure"
    t.text "event_description"
    t.string "event_title"
    t.datetime "scheduled_at"
    t.integer "duration"
    t.datetime "end_time"
    t.bigint "user_id", null: false
    t.bigint "garden_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_id"], name: "index_visits_on_garden_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "visits", "gardens"
  add_foreign_key "visits", "users"
end
