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

ActiveRecord::Schema[7.0].define(version: 2023_03_01_140229) do
  create_table "admins", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "status", default: "inactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "developers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "status"
    t.string "password_digest"
    t.integer "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_developers_on_created_by_id"
  end

  create_table "project_developers", force: :cascade do |t|
    t.integer "project_id"
    t.integer "developer_id"
    t.integer "added_by_id"
    t.datetime "added_on"
    t.datetime "removed_on"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_project_developers_on_added_by_id"
    t.index ["developer_id"], name: "index_project_developers_on_developer_id"
    t.index ["project_id"], name: "index_project_developers_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.integer "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_projects_on_created_by_id"
  end

  add_foreign_key "developers", "admins", column: "created_by_id"
  add_foreign_key "project_developers", "admins", column: "added_by_id"
  add_foreign_key "projects", "admins", column: "created_by_id"
end
