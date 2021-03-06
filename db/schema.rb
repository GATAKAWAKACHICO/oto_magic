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

ActiveRecord::Schema.define(:version => 20120325193000) do

  create_table "groups", :force => true do |t|
    t.string   "organizer"
    t.string   "participant1"
    t.string   "participant2"
    t.string   "participant3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reports", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_artists", :force => true do |t|
    t.string   "facebook_id"
    t.string   "facebook_name"
    t.string   "artist_name"
    t.string   "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "facebook_id"
    t.string   "facebook_name"
    t.string   "facebook_gender"
    t.string   "facebook_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id", :unique => true

end
