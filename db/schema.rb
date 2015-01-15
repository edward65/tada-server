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

ActiveRecord::Schema.define(version: 20150115091504) do

  create_table "orders", force: :cascade do |t|
    t.integer  "store_id"
    t.string   "store_name"
    t.integer  "user_id"
    t.integer  "status"
    t.string   "reject_reason"
    t.string   "content"
    t.datetime "accepted_at"
    t.datetime "finished_at"
    t.integer  "order_fee"
    t.integer  "delivery_fee"
    t.integer  "items_fee"
    t.integer  "tip"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "tele"
    t.string   "verify_code"
    t.string   "fb_token"
    t.string   "notification_token"
    t.string   "invite_code"
    t.string   "email"
    t.integer  "status",             limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
