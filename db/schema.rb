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

ActiveRecord::Schema.define(version: 2019_05_22_135334) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_name"], name: "index_artists_on_artist_name"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "cd_id", null: false
    t.integer "user_id", null: false
    t.integer "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cd_id"], name: "index_carts_on_cd_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "cds", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "label_id", null: false
    t.integer "genre_id", null: false
    t.datetime "release", null: false
    t.integer "price", null: false
    t.integer "stock", null: false
    t.string "single_album_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cd_image_id"
    t.index ["single_album_name"], name: "index_cds_on_single_album_name"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre"], name: "index_genres_on_genre"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "othersaddresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "familyname", null: false
    t.string "firstname", null: false
    t.string "kana_familyname", null: false
    t.string "kana_firstname", null: false
    t.string "telephone_number", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_othersaddresses_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "cd_id", null: false
    t.integer "receipt_id", null: false
    t.integer "purches_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "amount", null: false
    t.index ["cd_id"], name: "index_purchases_on_cd_id"
    t.index ["receipt_id"], name: "index_purchases_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "shipping_familyname", null: false
    t.string "shipping_firstname", null: false
    t.string "shipping_kana_familyname", null: false
    t.string "shipping_kana_firstname", null: false
    t.string "shipping_postal", null: false
    t.string "shipping_address", null: false
    t.string "shipping_telephone_number", null: false
    t.integer "payment", null: false
    t.integer "status", null: false
    t.integer "postage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_receipts_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "cd_id", null: false
    t.integer "disc_num", null: false
    t.string "song_title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_title"], name: "index_songs_on_song_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "familyname", null: false
    t.string "firstname", null: false
    t.string "kana_familyname", null: false
    t.string "kana_firstname", null: false
    t.string "telephone_number", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true, where: "deleted_at IS NULL"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
