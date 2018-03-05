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

ActiveRecord::Schema.define(version: 20150826040234) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.text     "description"
    t.string   "uuid",        limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true
  add_index "categories", ["user_id"], name: "index_categories_on_user_id"
  add_index "categories", ["uuid"], name: "index_categories_on_uuid", unique: true

  create_table "expedition_gear_lists", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "expedition_id"
    t.integer  "gear_list_id"
  end

  add_index "expedition_gear_lists", ["expedition_id"], name: "index_expedition_gear_lists_on_expedition_id"
  add_index "expedition_gear_lists", ["gear_list_id"], name: "index_expedition_gear_lists_on_gear_list_id"

  create_table "expeditions", force: :cascade do |t|
    t.string   "name",        limit: 255,                 null: false
    t.text     "description"
    t.string   "uuid",        limit: 255,                 null: false
    t.string   "slug",        limit: 255
    t.boolean  "blessed",                 default: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_id"
  end

  add_index "expeditions", ["blessed"], name: "index_expeditions_on_blessed"
  add_index "expeditions", ["slug"], name: "index_expeditions_on_slug", unique: true
  add_index "expeditions", ["user_id"], name: "index_expeditions_on_user_id"
  add_index "expeditions", ["uuid"], name: "index_expeditions_on_uuid", unique: true

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "gear_list_item_infos", force: :cascade do |t|
    t.boolean  "checked",           default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "gear_list_item_id"
    t.integer  "user_id"
  end

  add_index "gear_list_item_infos", ["gear_list_item_id"], name: "index_gear_list_item_infos_on_gear_list_item_id"
  add_index "gear_list_item_infos", ["user_id"], name: "index_gear_list_item_infos_on_user_id"

  create_table "gear_list_items", force: :cascade do |t|
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "gear_list_id"
    t.integer  "item_id"
    t.integer  "quantity",     default: 1
  end

  add_index "gear_list_items", ["gear_list_id"], name: "index_gear_list_items_on_gear_list_id"
  add_index "gear_list_items", ["item_id"], name: "index_gear_list_items_on_item_id"

  create_table "gear_lists", force: :cascade do |t|
    t.string   "name",                                   null: false
    t.string   "uuid",                                   null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.integer  "category_id"
    t.string   "api_token",   limit: 16
    t.string   "slug"
    t.boolean  "blessed",                default: false
    t.text     "description"
  end

  add_index "gear_lists", ["blessed"], name: "index_gear_lists_on_blessed"
  add_index "gear_lists", ["deleted_at"], name: "index_gear_lists_on_deleted_at"
  add_index "gear_lists", ["slug"], name: "index_gear_lists_on_slug", unique: true
  add_index "gear_lists", ["user_id"], name: "index_gear_lists_on_user_id"
  add_index "gear_lists", ["uuid"], name: "index_gear_lists_on_uuid", unique: true

  create_table "items", force: :cascade do |t|
    t.string   "name",           limit: 255,                 null: false
    t.text     "description"
    t.integer  "default_amount",             default: 1
    t.string   "uuid",           limit: 255,                 null: false
    t.boolean  "locked",                     default: false
    t.string   "api_token",      limit: 16,                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.datetime "deleted_at"
    t.boolean  "blessed",                    default: false
  end

  add_index "items", ["blessed"], name: "index_items_on_blessed"
  add_index "items", ["deleted_at"], name: "index_items_on_deleted_at"
  add_index "items", ["name"], name: "index_items_on_name", unique: true
  add_index "items", ["user_id"], name: "index_items_on_user_id"
  add_index "items", ["uuid"], name: "index_items_on_uuid", unique: true

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "admin_level",            default: 0
    t.string   "name"
    t.string   "uuid"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

end
