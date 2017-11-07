Rails.application.routes.draw do
  root 'movies#index'

  get 'movies/(show)(/:num_mv)',	to: 'movies#show',	as: 'movie_sp'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
