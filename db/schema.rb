# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define() do

  create_table "carts", :force => true do |t|
    t.string   "ip",            :limit => 64
    t.integer  "voted_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position",                    :default => 0
  end

  create_table "tempips", :force => true do |t|
    t.string   "ip",         :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname",     :limit => 100
    t.string   "lastname",      :limit => 100
    t.string   "email"
    t.string   "username",      :limit => 100
    t.text     "address"
    t.string   "zip",           :limit => 10
    t.string   "city",          :limit => 100
    t.string   "hairdresser",   :limit => 100
    t.string   "picture"
    t.string   "picture_title"
    t.integer  "note",                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",                       :default => 0
    t.string   "category",      :limit => 4
    t.string   "saloon",        :limit => 100
    t.string   "saloonaddr"
    t.string   "saloonzip",     :limit => 10
    t.string   "salooncity",    :limit => 100
  end

end
