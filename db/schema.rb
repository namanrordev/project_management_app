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

ActiveRecord::Schema[7.1].define(version: 2025_07_10_141755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "co_authors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "proposal_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_co_authors_on_proposal_id"
    t.index ["user_id"], name: "index_co_authors_on_user_id"
  end

  create_table "proposal_approvals", force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_proposal_approvals_on_proposal_id"
    t.index ["user_id"], name: "index_proposal_approvals_on_user_id"
  end

  create_table "proposal_costs", force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.string "category"
    t.text "description"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_proposal_costs_on_proposal_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "feasibility_score"
    t.text "review_comment"
    t.string "approval_status"
    t.string "implementation_status", default: "approved"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "co_authors", "proposals"
  add_foreign_key "co_authors", "users"
  add_foreign_key "proposal_approvals", "proposals"
  add_foreign_key "proposal_approvals", "users"
  add_foreign_key "proposal_costs", "proposals"
  add_foreign_key "proposals", "users"
end
