class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :duration
      t.datetime :departure_date
      t.references :departure_airport, foreign_key: true
      t.references :arrival_airport, foreign_key: true

      t.timestamps
    end
  end
end
