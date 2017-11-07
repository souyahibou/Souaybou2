class MoviesController < ApplicationController
  def index
	@the_films = Movie.all
  end

  def show
      if params[:num_mv]
	@le_film = Movie.find(params[:num_mv])
      end
  end
end
