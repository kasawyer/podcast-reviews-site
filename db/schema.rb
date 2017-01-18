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

ActiveRecord::Schema.define(version: 20170117225554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id", null: false
    t.integer  "podcast_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id", "podcast_id"], name: "index_categorizations_on_category_id_and_podcast_id", unique: true, using: :btree
    t.index ["category_id"], name: "index_categorizations_on_category_id", using: :btree
    t.index ["podcast_id"], name: "index_categorizations_on_podcast_id", using: :btree
  end

  create_table "hosts", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "podcast_hosts", force: :cascade do |t|
    t.integer  "host_id",    null: false
    t.integer  "podcast_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id", "podcast_id"], name: "index_podcast_hosts_on_host_id_and_podcast_id", unique: true, using: :btree
    t.index ["host_id"], name: "index_podcast_hosts_on_host_id", using: :btree
    t.index ["podcast_id"], name: "index_podcast_hosts_on_podcast_id", using: :btree
  end

  create_table "podcasts", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "provider_id",    null: false
    t.text     "description"
    t.integer  "release_year"
    t.string   "itunes_url"
    t.string   "soundcloud_url"
    t.string   "image_url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["provider_id", "name"], name: "index_podcasts_on_provider_id_and_name", unique: true, using: :btree
    t.index ["provider_id"], name: "index_podcasts_on_provider_id", using: :btree
  end

  create_table "providers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
