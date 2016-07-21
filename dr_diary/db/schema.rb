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

ActiveRecord::Schema.define(version: 20160713140917) do

  create_table "diaries", force: :cascade do |t|
    t.string   "name",        limit: 25
    t.string   "visibility",  limit: 255, default: "1"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id",     limit: 4
    t.string   "diary_image", limit: 255
  end

  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id", using: :btree

  create_table "followers", id: false, force: :cascade do |t|
    t.integer  "user_id",     limit: 4, null: false
    t.integer  "follower_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",         limit: 35
    t.text     "content",       limit: 65535
    t.boolean  "visibility",                  default: true
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "user_id",       limit: 4
    t.integer  "diary_id",      limit: 4
    t.text     "post_pictures", limit: 65535
  end

  add_index "posts", ["diary_id"], name: "index_posts_on_diary_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",           limit: 25
    t.string   "last_name",            limit: 25
    t.string   "email",                limit: 255, null: false
    t.string   "username",             limit: 25
    t.string   "password_digest",      limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "user_profile_picture", limit: 255
  end

  add_index "users", ["id"], name: "index_users_on_id", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "diaries", "users"
  add_foreign_key "posts", "diaries"
  add_foreign_key "posts", "users"
end
