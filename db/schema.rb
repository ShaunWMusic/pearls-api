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

ActiveRecord::Schema.define(version: 20180610143643) do

  create_table "barbershop_inventories", force: :cascade do |t|
    t.string "delivery_date"
    t.string "barbershop_name"
    t.integer "beardbark"
    t.integer "sandycheeks"
    t.text "comments"
    t.string "contact_person"
    t.integer "total_beard_oils_delivered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "barbershop"
    t.string "contact_person"
    t.string "phone_number"
    t.string "email"
    t.text "call_log"
    t.string "website"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.boolean "is_admin"
    t.boolean "is_barbershop"
    t.boolean "is_customer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
