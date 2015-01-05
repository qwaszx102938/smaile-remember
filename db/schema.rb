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

ActiveRecord::Schema.define(version: 20150105085211) do

  create_table "alert_item_hists", force: true do |t|
    t.integer  "remember_item_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "state"
    t.datetime "alert_time"
  end

  add_index "alert_item_hists", ["user_id"], name: "index_alert_item_hists_on_user_id"

  create_table "alert_items", force: true do |t|
    t.integer  "remember_item_id"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "state"
    t.datetime "alert_time"
  end

  add_index "alert_items", ["user_id"], name: "index_alert_items_on_user_id"

  create_table "remember_items", force: true do |t|
    t.integer  "user_id"
    t.integer  "remember_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remember_items", ["remember_id"], name: "index_remember_items_on_remember_id"
  add_index "remember_items", ["user_id"], name: "index_remember_items_on_user_id"

  create_table "remembers", force: true do |t|
    t.string   "remember_content"
    t.text     "remember_reference"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "remembers", ["remember_content"], name: "index_remembers_on_remember_content", unique: true

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
