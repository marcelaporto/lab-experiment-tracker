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

ActiveRecord::Schema.define(version: 20170331215005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body",             null: false
    t.integer  "user_id",          null: false
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "description"
    t.integer  "procedure_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["procedure_id"], name: "index_equipment_on_procedure_id", using: :btree
  end

  create_table "experiments", force: :cascade do |t|
    t.string   "title",        null: false
    t.integer  "scientist_id", null: false
    t.integer  "proposal_id"
    t.text     "results"
    t.text     "conclusions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "observations", force: :cascade do |t|
    t.string   "body",               null: false
    t.integer  "scientist_id",       null: false
    t.integer  "observational_id"
    t.string   "observational_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "procedures", force: :cascade do |t|
    t.string   "body"
    t.integer  "experiment_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.integer  "status",     default: 1
    t.text     "summary"
    t.text     "hypothesis"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string  "first_name",      null: false
    t.string  "last_name",       null: false
    t.string  "email",           null: false
    t.boolean "isScientist",     null: false
    t.string  "password_digest"
  end

end
