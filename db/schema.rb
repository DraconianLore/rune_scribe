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

ActiveRecord::Schema.define(version: 2022_01_12_163835) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "levels", force: :cascade do |t|
    t.bigint "structure_id"
    t.integer "all"
    t.integer "mind"
    t.integer "power"
    t.integer "death"
    t.integer "life"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "runes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "house"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "level"
    t.string "trace"
    t.string "draw"
    t.text "additional"
    t.string "target", default: [], array: true
    t.string "tags", array: true
  end

  create_table "runes_structures", force: :cascade do |t|
    t.bigint "structure_id"
    t.bigint "rune_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rune_id"], name: "index_runes_structures_on_rune_id"
    t.index ["structure_id"], name: "index_runes_structures_on_structure_id"
  end

  create_table "runes_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "rune_id"
    t.index ["rune_id"], name: "index_runes_tags_on_rune_id"
    t.index ["tag_id"], name: "index_runes_tags_on_tag_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "sub_structures", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "trace"
    t.string "draw"
    t.boolean "strained", default: false
    t.string "dominant"
    t.text "additional"
    t.integer "number_of_runes"
    t.boolean "discovered", default: false
    t.string "target", default: [], array: true
    t.string "tags", array: true
  end

  create_table "structures_tags", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "structure_id"
    t.index ["structure_id"], name: "index_structures_tags_on_structure_id"
    t.index ["tag_id"], name: "index_structures_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.string "background"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "dungeonmaster", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "character"
    t.integer "level", default: 1
    t.string "house", default: "None"
    t.string "theme", default: "Mind"
    t.string "follower"
  end

end
