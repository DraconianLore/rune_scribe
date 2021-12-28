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

ActiveRecord::Schema.define(version: 2021_12_27_231537) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "runes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "house"
    t.string "tags", default: ["rune"], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "runes_structures", force: :cascade do |t|
    t.bigint "structure_id"
    t.bigint "rune_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rune_id"], name: "index_runes_structures_on_rune_id"
    t.index ["structure_id"], name: "index_runes_structures_on_structure_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "tags", default: ["structure"], array: true
    t.string "sub_structures", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "dungeonmaster"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "character"
    t.integer "level", default: 1
    t.string "house", default: "None"
  end

end
