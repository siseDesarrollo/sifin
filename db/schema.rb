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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20161109040428) do

  create_table "roles", :force => true do |t|
    t.string   "name",        :limit => 45,  :null => false
    t.string   "description", :limit => 245, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "roles", ["name"], :name => "index_role_name", :unique => true

  create_table "user_sessions", :force => true do |t|
    t.string   "session_id", :limit => 30, :null => false
    t.text     "data"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "user_sessions", ["session_id"], :name => "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], :name => "index_user_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name",                :limit => 45,  :default => "",   :null => false
    t.string   "last_name",           :limit => 45,                    :null => false
    t.string   "second_last_name",    :limit => 45,                    :null => false
    t.string   "login",               :limit => 30,                    :null => false
    t.string   "crypted_password",    :limit => 100,                   :null => false
    t.string   "password_salt",       :limit => 100,                   :null => false
    t.string   "email",               :limit => 100,                   :null => false
    t.string   "persistence_token",   :limit => 100,                   :null => false
    t.string   "single_access_token"
    t.string   "perishable_token",    :limit => 100,                   :null => false
    t.integer  "login_count",                        :default => 0,    :null => false
    t.integer  "failed_login_count",                 :default => 0,    :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip",    :limit => 100
    t.string   "last_login_ip",       :limit => 100
    t.boolean  "is_active",                          :default => true, :null => false
    t.integer  "role_id",                                              :null => false
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
