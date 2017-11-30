Rails.application.routes.draw do
  resources :emails
  # get 'emails/new'
  #
  # get 'emails/create'
  #
  # get 'emails/update'
  #
  # get 'emails/edit'
  #
  # get 'emails/destroy'
  #
  # get 'emails/index',  to: 'emails#index'
  #
  # get 'emails/show'

  root to: 'emails#index'      #or root 'emails#edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
