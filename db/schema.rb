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

ActiveRecord::Schema.define(version: 20151123163614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "point_of_interests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date_added"
    t.integer  "owner_id"
    t.integer  "tracking_device_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "point_of_interests", ["owner_id"], name: "index_point_of_interests_on_owner_id", using: :btree
  add_index "point_of_interests", ["tracking_device_id"], name: "index_point_of_interests_on_tracking_device_id", using: :btree

  create_table "tracking_devices", force: :cascade do |t|
    t.string   "device_name"
    t.string   "device_type"
    t.integer  "poi_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tracking_devices", ["poi_id"], name: "index_tracking_devices_on_poi_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.date     "date_of_birth"
    t.string   "auth_token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
