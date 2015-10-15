# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151015154131) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_skills", force: :cascade do |t|
    t.integer  "applicant_id"
    t.integer  "skill_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "applicant_skills", ["applicant_id"], name: "index_applicant_skills_on_applicant_id", using: :btree
  add_index "applicant_skills", ["skill_id"], name: "index_applicant_skills_on_skill_id", using: :btree

  create_table "applicants", force: :cascade do |t|
    t.string   "name"
    t.string   "contact"
    t.integer  "status"
    t.integer  "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacancies", force: :cascade do |t|
    t.string   "name"
    t.date     "created_date"
    t.integer  "validity"
    t.integer  "salary"
    t.string   "contact"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vacancy_skills", force: :cascade do |t|
    t.integer  "vacancy_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vacancy_skills", ["skill_id"], name: "index_vacancy_skills_on_skill_id", using: :btree
  add_index "vacancy_skills", ["vacancy_id"], name: "index_vacancy_skills_on_vacancy_id", using: :btree

  add_foreign_key "applicant_skills", "applicants"
  add_foreign_key "applicant_skills", "skills"
  add_foreign_key "vacancy_skills", "skills"
  add_foreign_key "vacancy_skills", "vacancies"
end
