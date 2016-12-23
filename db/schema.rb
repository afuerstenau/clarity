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

ActiveRecord::Schema.define(version: 20161223092717) do

  create_table "components", force: :cascade do |t|
    t.integer  "connection_id"
    t.integer  "top_connection_id"
    t.integer  "bottom_connection_id"
    t.integer  "service_id"
    t.string   "name"
    t.string   "notes"
    t.string   "repo"
    t.string   "location"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["bottom_connection_id"], name: "index_components_on_bottom_connection_id"
    t.index ["connection_id"], name: "index_components_on_connection_id"
    t.index ["service_id"], name: "index_components_on_service_id"
    t.index ["top_connection_id"], name: "index_components_on_top_connection_id"
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "component_id"
    t.integer  "top_component_id"
    t.integer  "bottom_component_id"
    t.integer  "service_id"
    t.string   "identifier"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["bottom_component_id"], name: "index_connections_on_bottom_component_id"
    t.index ["component_id"], name: "index_connections_on_component_id"
    t.index ["service_id"], name: "index_connections_on_service_id"
    t.index ["top_component_id"], name: "index_connections_on_top_component_id"
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.         "component"
    t.index ["name"], name: "index_services_on_name", unique: true
  end

end
