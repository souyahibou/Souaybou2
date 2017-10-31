Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :authors
  resources :posts
  resources :cours
  resources :lecons
  resources :pins
  resources :comments
  resources :users
  resources :links
  resources :matters
  resources :students
end
