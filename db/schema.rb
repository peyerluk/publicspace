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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120213201842) do

  create_table "articles", :force => true do |t|
    t.integer  "source_id"
    t.string   "crawler"
    t.integer  "tweets"
    t.integer  "facebook_shares"
    t.integer  "google_plus"
    t.integer  "bookmarks"
    t.integer  "comments"
    t.string   "title"
    t.text     "text"
    t.text     "content_data"
    t.datetime "published_at"
    t.datetime "last_visit"
    t.datetime "next_visit"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "mentions", :force => true do |t|
    t.integer  "source_id"
    t.integer  "origin_id"
    t.string   "origin_type"
    t.integer  "mentioned_source_id"
    t.integer  "mentioned_article_id"
    t.string   "mentioned_url"
    t.text     "data"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "origin"
    t.string   "identifier"
    t.string   "crawler"
    t.text     "data"
    t.datetime "last_visit"
    t.datetime "next_visit"
    t.boolean  "active",     :default => true
    t.string   "type"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "stores", :force => true do |t|
    t.string   "key"
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "stores", ["key"], :name => "index_stores_on_key"

  create_table "tweets", :force => true do |t|
    t.integer  "source_id"
    t.integer  "tweet_id"
    t.string   "text",         :limit => 160
    t.text     "data"
    t.datetime "published_at"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
