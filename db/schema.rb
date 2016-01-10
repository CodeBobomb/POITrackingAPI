# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160110102250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "headquarters"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "point_of_interests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date_added"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
    t.float    "lat"
    t.float    "lng"
    t.boolean  "tracking"
  end

  create_table "points", force: :cascade do |t|
    t.float    "lng"
    t.float    "lat"
    t.integer  "point_of_interest_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "inc"
    t.float    "lng_inc"
    t.float    "lat_inc"
    t.float    "inc_value"
  end

  add_index "points", ["point_of_interest_id"], name: "index_points_on_point_of_interest_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_key"
    t.date     "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "user_id"
  end

  create_table "states", force: :cascade do |t|
    t.boolean  "motor_running",        default: false
    t.boolean  "windows_up",           default: false
    t.boolean  "car_locked",           default: false
    t.integer  "point_of_interest_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "states", ["point_of_interest_id"], name: "index_states_on_point_of_interest_id", using: :btree

  create_table "tracking_devices", force: :cascade do |t|
    t.string   "device_name"
    t.string   "device_type"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "point_of_interest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.date     "date_of_birth"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "company_id"
  end

  add_foreign_key "points", "point_of_interests"
  add_foreign_key "states", "point_of_interests"
end
