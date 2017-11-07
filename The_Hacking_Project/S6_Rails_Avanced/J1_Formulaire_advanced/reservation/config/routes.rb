Rails.application.routes.draw do
  root 'flights#index'

  get 'flights/index', to: 'flights#index', as: 'index'

  resources :flights, only: [:new, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
