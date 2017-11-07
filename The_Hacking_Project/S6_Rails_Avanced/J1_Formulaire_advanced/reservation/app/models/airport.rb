class Airport < ApplicationRecord
  has_many :departure_flights, foreign_key: "departure_airport_id", class_name: "Flight", inverse_of: 'departure_airport'
  has_many :arrival_flights, foreign_key: "arrival_airport_id", class_name: "Flight", inverse_of: 'arrival_airport'
end
