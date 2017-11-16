Rails.application.routes.draw do

  get "users/login",  to: "users#login", as: :new_way_add_users
  root "users#login"
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
