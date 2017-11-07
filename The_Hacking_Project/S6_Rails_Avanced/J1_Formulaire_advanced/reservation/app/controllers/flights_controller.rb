class FlightsController < ApplicationController

  def index
    @user_options = Airport.all.map{ |u| [ u.airport_code, u.id ] }
    @airports = Airport.all
    if params[:flight]
        @flights = Flight.search flight_params[:date_f],  flight_params[:departure_airport], flight_params[:arrival_airport]
    else
        @flights = Flight.all
    end
  end



  def new

  end

  def create
      @booking= booking.new(flight_params[:fight_choosen])
      #construire le nombre de passengers indiquées
	  if @booking.save
	     redirect_to @booking
	  else
	     render 'new'
	  end
  end



private
  def flight_params
    params.require(:flight).permit(:departure_airport, :arrival_airport, :date_f, :nbr, :fight_choosen)
  end

end




# Flight.where({departure_airport_id: Airport.where(airport_code:flight_params[:departure_airport]).first.id, arrival_airport_id: Airport.where(airport_code:flight_params[:arrival_airport]).first.id, departure_date:flight_params[:departure_airport].strftime("%Y-%m-%d %H:%M:%S") })
# Flight.where({departure_airport_id: Airport.where(airport_code:flight_params[:departure_airport]).first.id})
# Flight.where({departure_date:flight_params[:departure_airport].strftime("%Y-%m-%d %H:%M:%S")})
# Flight.where({departure_date:Faker::Date.between(Date.today,7.days.from_now).strftime("%Y-%m-%d %H:%M:%S")})
#
# Payment.where(:id => Payment.group(:user_id).pluck(:id))
# Flight.includes(:arrival_airport).where({flights:{arrival_airport:{airport_code:"CDG"} } })
# Flight.joins(:arrival_airport).where({flights:{arrival_airport:{airport_code:"CDG"} } })


#
# @flights = if  flight_params[:date_f] && flight_params[:departure_airport]  && flight_params[:arrival_airport]
#               vol = Flight.where({departure_airport_id: flight_params[:departure_airport], arrival_airport_id: flight_params[:arrival_airport], departure_date:flight_params[:date_f].to_time.strftime("%Y-%m-%d %H:%M:%S") })
#               if vol.count == 0 then  Flight.all else vol end
#             else
#               Flight.all
#             end
