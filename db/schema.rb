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

ActiveRecord::Schema[8.0].define(version: 2025_01_20_130146) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "rails_version", null: false
    t.string "repository_url"
    t.string "status", default: "draft"
    t.bigint "generator_option_id", null: false
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["generator_option_id"], name: "index_applications_on_generator_option_id"
    t.index ["name"], name: "index_applications_on_name"
    t.index ["slug"], name: "index_applications_on_slug", unique: true
    t.index ["template_id"], name: "index_applications_on_template_id"
  end

  create_table "generator_options", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.jsonb "options", default: {}, null: false
    t.bigint "template_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_generator_options_on_name", unique: true
    t.index ["options"], name: "index_generator_options_on_options", using: :gin
    t.index ["slug"], name: "index_generator_options_on_slug", unique: true
    t.index ["template_id"], name: "index_generator_options_on_template_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "path"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_templates_on_name", unique: true
    t.index ["slug"], name: "index_templates_on_slug", unique: true
  end

  add_foreign_key "applications", "generator_options"
  add_foreign_key "applications", "templates"
  add_foreign_key "generator_options", "templates"
end
