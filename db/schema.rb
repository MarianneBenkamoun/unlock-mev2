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

ActiveRecord::Schema.define(version: 20180313132813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "sku"
    t.integer "price_cents"
    t.string "status"
    t.json "payment"
    t.boolean "accepted"
    t.datetime "date"
    t.string "datetext"
    t.string "hourtext"
    t.string "photodoor"
    t.string "photoserrure"
    t.string "estimate"
    t.bigint "profile_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_courses_on_profile_id"
    t.index ["service_id"], name: "index_courses_on_service_id"
  end

  create_table "entreprises", force: :cascade do |t|
    t.string "maisonmere"
    t.string "entreprise"
    t.bigint "profile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_entreprises_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.boolean "status"
    t.string "photo"
    t.string "phone_number"
    t.string "last_name"
    t.string "first_name"
    t.string "profile_type"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "price"
    t.string "description"
    t.bigint "profile_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["profile_id"], name: "index_reviews_on_profile_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "picture"
    t.integer "price"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_services_on_parent_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "type_of"
    t.string "address"
    t.float "longitude"
    t.float "latitude"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_sites_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "profile_type"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.boolean "status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "profiles"
  add_foreign_key "courses", "services"
  add_foreign_key "entreprises", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "profiles"
  add_foreign_key "sites", "courses"
end
