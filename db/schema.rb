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

ActiveRecord::Schema.define(version: 20170714170731) do

  create_table "bloggers", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "paragraph_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["paragraph_id"], name: "index_comments_on_paragraph_id"

  create_table "paragraphs", force: :cascade do |t|
    t.text     "data"
    t.integer  "blogger_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "paragraphs", ["blogger_id"], name: "index_paragraphs_on_blogger_id"

end