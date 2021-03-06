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

ActiveRecord::Schema.define(:version => 20130519160605) do

  create_table "admins", :force => true do |t|
    t.string   "first_name",                     :null => false
    t.string   "last_name",                      :null => false
    t.string   "email",                          :null => false
    t.string   "password_digest",                :null => false
    t.string   "image"
    t.string   "phone_number"
    t.integer  "status",          :default => 2
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "institute_requests", :force => true do |t|
    t.string   "institute_id",                       :null => false
    t.string   "probation_advert_id",                :null => false
    t.integer  "status",              :default => 2
    t.text     "content",                            :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
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

  create_table "probation_adverts", :force => true do |t|
    t.string   "sayi",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "probation_locations", :force => true do |t|
    t.string   "student_no",                    :null => false
    t.string   "probation_type",                :null => false
    t.string   "institute_name",                :null => false
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "status",         :default => 2
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "student_files", :force => true do |t|
    t.integer  "student_id"
    t.string   "name"
    t.string   "file"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

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
