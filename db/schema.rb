# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_927_111_317) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'articles', force: :cascade do |t|
    t.string 'title'
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'line_items', force: :cascade do |t|
    t.bigint 'product_id', null: false
    t.bigint 'order_id', null: false
    t.decimal 'unit_price', precision: 12, scale: 3
    t.integer 'quantity'
    t.decimal 'total_price', precision: 12, scale: 3
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['order_id'], name: 'index_line_items_on_order_id'
    t.index ['product_id'], name: 'index_line_items_on_product_id'
  end

  create_table 'listings', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'city'
    t.string 'state'
    t.string 'zipcode'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'category_id'
    t.integer 'sub_category_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.decimal 'subtotal', precision: 12, scale: 3
    t.decimal 'tax', precision: 12, scale: 3
    t.decimal 'shipping', precision: 12, scale: 3
    t.decimal 'total', precision: 12, scale: 3
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'products', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.decimal 'price', precision: 12, scale: 3
    t.boolean 'active'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sub_categories', force: :cascade do |t|
    t.string 'name'
    t.integer 'category_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'role', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'line_items', 'orders'
  add_foreign_key 'line_items', 'products'
end
