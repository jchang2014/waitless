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

ActiveRecord::Schema.define(version: 20150720165729) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reservations", force: :cascade do |t|
    t.integer  "number_in_party"
    t.integer  "timers"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "restaurant_types", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "type_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "yelp_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "wait_time",  default: 0
  end

  create_table "types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "admin"
    t.boolean  "proprietor"

  end

end
