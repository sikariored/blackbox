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

ActiveRecord::Schema[7.1].define(version: 2024_02_09_102241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credentials", force: :cascade do |t|
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credentials_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "credential_id"
    t.index ["credential_id"], name: "index_credentials_users_on_credential_id"
    t.index ["user_id"], name: "index_credentials_users_on_user_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "key", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.string "encrypted_title", null: false
    t.string "encrypted_title_iv"
    t.string "encrypted_body"
    t.string "encrypted_body_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "key"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secure_records", force: :cascade do |t|
    t.string "encrypted_title", null: false
    t.string "encrypted_title_iv"
    t.string "encrypted_login"
    t.string "encrypted_login_iv"
    t.string "encrypted_password"
    t.string "encrypted_password_iv"
    t.string "encrypted_description"
    t.string "encrypted_description_iv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_secure_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login", default: ""
    t.string "first_name", default: ""
    t.string "last_name", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.bigint "department_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "notes", "users"
  add_foreign_key "secure_records", "users"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
end
