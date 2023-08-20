# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2016_10_31_224656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attending_churches", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "main_leader"
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["volunteer_id"], name: "index_attending_churches_on_volunteer_id"
  end

  create_table "home_distributions", id: :serial, force: :cascade do |t|
    t.boolean "except_homes"
    t.boolean "numbers_from_buildings"
    t.string "number_from_homes_to_distribute"
    t.boolean "deliver_on_building_for_all"
    t.string "building_name"
    t.integer "volunteer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["volunteer_id"], name: "index_home_distributions_on_volunteer_id"
  end

  create_table "phones", id: :serial, force: :cascade do |t|
    t.integer "ddd"
    t.string "number"
    t.integer "kind"
    t.integer "volunteer_cellphone_id"
    t.integer "volunteer_residential_phone_id"
    t.boolean "whatsapp", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["volunteer_cellphone_id"], name: "index_phones_on_volunteer_cellphone_id"
    t.index ["volunteer_residential_phone_id"], name: "index_phones_on_volunteer_residential_phone_id"
  end

  create_table "volunteers", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "terms_to_receive"
  end

  add_foreign_key "attending_churches", "volunteers"
  add_foreign_key "home_distributions", "volunteers"
  add_foreign_key "phones", "volunteers", column: "volunteer_cellphone_id"
  add_foreign_key "phones", "volunteers", column: "volunteer_residential_phone_id"
end
