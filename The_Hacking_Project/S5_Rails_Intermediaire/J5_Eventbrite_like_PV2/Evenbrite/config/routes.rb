Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  get 'users/index'

  get 'users/show'

  resources :users# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
