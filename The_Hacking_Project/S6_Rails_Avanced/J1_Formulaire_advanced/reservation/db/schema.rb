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

ActiveRecord::Schema.define(version: 20171107210731) do

  create_table "airports", force: :cascade do |t|
    t.string "airport_code"
    t.string "airport_name"
    t.string "airport_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "airports_flights", id: false, force: :cascade do |t|
    t.integer "flight_id", null: false
    t.integer "airport_id", null: false
    t.index ["flight_id", "airport_id"], name: "index_airports_flights_on_flight_id_and_airport_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "name"
    t.integer "flight_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "bookings_passengers", id: false, force: :cascade do |t|
    t.integer "passenger_id", null: false
    t.integer "booking_id", null: false
    t.index ["booking_id", "passenger_id"], name: "index_bookings_passengers_on_booking_id_and_passenger_id"
    t.index ["passenger_id", "booking_id"], name: "index_bookings_passengers_on_passenger_id_and_booking_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "duration"
    t.datetime "departure_date"
    t.integer "departure_airport_id"
    t.integer "arrival_airport_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
