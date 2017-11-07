class CreateDirectJoinTableVolsAeroports < ActiveRecord::Migration[5.1]
  def change
    create_join_table :flights, :airports do |t|
       t.index [:flight_id, :airport_id]
       t.index [:airport_id, :flight_id]
    end
  end
end
