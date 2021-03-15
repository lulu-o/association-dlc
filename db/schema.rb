# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_14_142347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "association_partners", force: :cascade do |t|
    t.bigint "association_id"
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["association_id"], name: "index_association_partners_on_association_id"
    t.index ["partner_id"], name: "index_association_partners_on_partner_id"
  end

  create_table "associations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email"
    t.string "role"
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_contacts_on_partner_id"
  end

  create_table "distributions", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.bigint "harvest_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["harvest_id"], name: "index_distributions_on_harvest_id"
  end

  create_table "distributors", force: :cascade do |t|
    t.bigint "distribution_id"
    t.bigint "user_id"
    t.boolean "distribution_place", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["distribution_id"], name: "index_distributors_on_distribution_id"
    t.index ["user_id"], name: "index_distributors_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_favorites_on_partner_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "harvest_slots", force: :cascade do |t|
    t.integer "day_of_the_week"
    t.time "hour"
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["partner_id"], name: "index_harvest_slots_on_partner_id"
  end

  create_table "harvesters", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "harvest_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["harvest_id"], name: "index_harvesters_on_harvest_id"
    t.index ["user_id"], name: "index_harvesters_on_user_id"
  end

  create_table "harvests", force: :cascade do |t|
    t.date "date"
    t.integer "harvesters_number"
    t.bigint "association_id"
    t.bigint "partner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "hour"
    t.index ["association_id"], name: "index_harvests_on_association_id"
    t.index ["partner_id"], name: "index_harvests_on_partner_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.integer "harvesters_number"
    t.bigint "brand_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_partners_on_brand_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "zipcode"
    t.string "city"
    t.boolean "active"
    t.boolean "admin"
    t.bigint "association_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["association_id"], name: "index_users_on_association_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "association_partners", "associations"
  add_foreign_key "association_partners", "partners"
  add_foreign_key "contacts", "partners"
  add_foreign_key "distributions", "harvests"
  add_foreign_key "distributors", "distributions"
  add_foreign_key "distributors", "users"
  add_foreign_key "favorites", "partners"
  add_foreign_key "favorites", "users"
  add_foreign_key "harvest_slots", "partners"
  add_foreign_key "harvesters", "harvests"
  add_foreign_key "harvesters", "users"
  add_foreign_key "harvests", "associations"
  add_foreign_key "harvests", "partners"
  add_foreign_key "partners", "brands"
  add_foreign_key "users", "associations"
end
