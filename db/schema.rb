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

ActiveRecord::Schema.define(:version => 20130505141555) do

  create_table "cities", :force => true do |t|
    t.string  "city",       :limit => 100
    t.integer "plate_code", :limit => 1,   :null => false
    t.integer "phone_code",                :null => false
    t.integer "siralama",                  :null => false
  end

  create_table "countries", :force => true do |t|
    t.string "dual_code",   :limit => 2,   :null => false
    t.string "triple_code", :limit => 3,   :null => false
    t.string "country",     :limit => 100, :null => false
    t.string "phone_code",  :limit => 6,   :null => false
  end

  add_index "countries", ["id"], :name => "id", :unique => true

  create_table "districts", :force => true do |t|
    t.integer "city_id",                :null => false
    t.string  "district", :limit => 60, :null => false
    t.string  "city",     :limit => 55, :null => false
  end

  create_table "institutes", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "email",                          :null => false
    t.string   "password_digest",                :null => false
    t.string   "phone_number"
    t.string   "image"
    t.integer  "status",          :default => 2
    t.integer  "role_id",                        :null => false
    t.integer  "city_id",                        :null => false
    t.integer  "district_id",                    :null => false
    t.string   "address"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "semtmah", :id => false, :force => true do |t|
    t.integer "id",                         :null => false
    t.string  "semt",        :limit => 60,  :null => false
    t.string  "mahalle",     :limit => 100, :null => false
    t.string  "post_code",   :limit => 6,   :null => false
    t.integer "district_id",                :null => false
  end

  add_index "semtmah", ["id"], :name => "id", :unique => true

  create_table "students", :force => true do |t|
    t.integer  "tc",              :limit => 8, :null => false
    t.string   "first_name",                   :null => false
    t.string   "last_name",                    :null => false
    t.string   "email",                        :null => false
    t.string   "password_digest",              :null => false
    t.string   "phone_number",                 :null => false
    t.string   "image"
    t.string   "gender",                       :null => false
    t.date     "birthday",                     :null => false
    t.string   "address"
    t.integer  "city_id",                      :null => false
    t.integer  "district_id",                  :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end
