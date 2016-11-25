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

ActiveRecord::Schema.define(version: 20161125033536) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "apartments", force: :cascade do |t|
    t.string   "apartment_name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "day_of_week"
    t.integer  "apartment_id"
    t.integer  "tenant_id"
    t.integer  "status_id"
    t.integer  "lease_id"
    t.string   "title"
    t.string   "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "resourceId"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leases", force: :cascade do |t|
    t.date     "lease_start"
    t.date     "lease_end"
    t.integer  "tenant_id"
    t.integer  "apartment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "status_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "tenant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
