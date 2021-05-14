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

ActiveRecord::Schema.define(version: 2021_05_14_183352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer "project_id"
    t.text "notes"
    t.string "date"
    t.string "time"
    t.integer "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "appointments_artists", force: :cascade do |t|
    t.integer "appointment_id"
    t.integer "artist_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "social_details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "appointment_id"
  end

  create_table "cart_products", id: false, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "total"
  end

  create_table "carts_products", id: false, force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "vendor_id"
  end

  create_table "categories_products", force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories_vendors", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "vendor_id"
  end

  create_table "dimensions", force: :cascade do |t|
    t.integer "height"
    t.integer "width"
    t.string "measurement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dimensions_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "dimension_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "expired_at", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tattoo_request_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "quantity"
    t.integer "shipping_height"
    t.integer "shipping_weight"
    t.string "image_folder"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products_sizes", force: :cascade do |t|
    t.integer "product_id"
    t.integer "size_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "project_notes", force: :cascade do |t|
    t.integer "project_id"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "tattoo_request_id"
    t.string "final_image"
    t.boolean "project_complete_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.integer "user_id"
    t.integer "artist_id"
    t.integer "price"
    t.string "progress_images", default: [], array: true
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tattoo_requests", force: :cascade do |t|
    t.integer "user_id"
    t.text "description"
    t.string "body_location_image_path"
    t.boolean "accepted"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "guest_email"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "allergies"
    t.string "guest_full_name"
    t.string "guest_phone"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "address"
    t.boolean "administrator"
    t.boolean "tattoo_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id"
    t.string "id_img_path"
    t.string "allergies"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "contact_name"
    t.string "contact_address"
    t.string "contact_phone"
    t.string "contact_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id"
  end

end
