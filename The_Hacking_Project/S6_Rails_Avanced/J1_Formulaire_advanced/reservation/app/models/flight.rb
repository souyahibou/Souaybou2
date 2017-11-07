class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many   :bookings

  def self.search(p1, p2, p3)
    if p1 && p2 && p3
        vol = self.where({departure_airport_id: p2, arrival_airport_id: p3, departure_date: p1.to_datetime.strftime("%Y-%m-%d %H:%M:%S")})     #.order('id DESC')
        if vol.count == 0 then  self.all else vol end
    else
        self.all                                   #order('id DESC')
    end
  end
end
