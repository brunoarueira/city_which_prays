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

ActiveRecord::Schema.define(version: 20161031224656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "complement"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "attending_churches", force: :cascade do |t|
    t.string   "name"
    t.string   "main_leader"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["volunteer_id"], name: "index_attending_churches_on_volunteer_id", using: :btree
  end

  create_table "home_distributions", force: :cascade do |t|
    t.boolean  "except_homes"
    t.boolean  "numbers_from_buildings"
    t.string   "number_from_homes_to_distribute"
    t.boolean  "deliver_on_building_for_all"
    t.string   "building_name"
    t.integer  "volunteer_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["volunteer_id"], name: "index_home_distributions_on_volunteer_id", using: :btree
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "ddd"
    t.string   "number"
    t.integer  "kind"
    t.integer  "volunteer_cellphone_id"
    t.integer  "volunteer_residential_phone_id"
    t.boolean  "whatsapp",                       default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["volunteer_cellphone_id"], name: "index_phones_on_volunteer_cellphone_id", using: :btree
    t.index ["volunteer_residential_phone_id"], name: "index_phones_on_volunteer_residential_phone_id", using: :btree
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.boolean  "terms_to_receive"
  end

  add_foreign_key "attending_churches", "volunteers"
  add_foreign_key "home_distributions", "volunteers"
  add_foreign_key "phones", "volunteers", column: "volunteer_cellphone_id"
  add_foreign_key "phones", "volunteers", column: "volunteer_residential_phone_id"
end
