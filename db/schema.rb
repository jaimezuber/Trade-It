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

ActiveRecord::Schema.define(version: 2022_07_09_182758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bios", force: :cascade do |t|
    t.string "username"
    t.text "description"
    t.float "rendimiento", default: 0.0
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "volatilidad", default: 0.0
    t.index ["user_id"], name: "index_bios_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.string "name"
    t.string "public_key"
    t.string "private_key"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "trade_id", null: false
    t.bigint "subscription_id", null: false
    t.float "open_price"
    t.float "close_price"
    t.string "external_id"
    t.float "pnl"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subscription_id"], name: "index_positions_on_subscription_id"
    t.index ["trade_id"], name: "index_positions_on_trade_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "amount_per_trade"
    t.integer "max_amount"
    t.float "rendimiento", default: 0.0
    t.bigint "trader_id", null: false
    t.bigint "subscriber_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "status", default: true
    t.index ["subscriber_id"], name: "index_subscriptions_on_subscriber_id"
    t.index ["trader_id"], name: "index_subscriptions_on_trader_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string "symbol"
    t.float "entry_price"
    t.float "exit_price"
    t.float "take_profit"
    t.float "stop_loss"
    t.string "side"
    t.bigint "trader_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "pnl"
    t.index ["trader_id"], name: "index_trades_on_trader_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bios", "users"
  add_foreign_key "exchanges", "users"
  add_foreign_key "positions", "subscriptions"
  add_foreign_key "positions", "trades"
  add_foreign_key "subscriptions", "users", column: "subscriber_id"
  add_foreign_key "subscriptions", "users", column: "trader_id"
  add_foreign_key "trades", "users", column: "trader_id"
end
