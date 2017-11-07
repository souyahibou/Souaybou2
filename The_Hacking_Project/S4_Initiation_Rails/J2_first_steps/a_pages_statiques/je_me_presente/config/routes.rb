Rails.application.routes.draw do
  get '/contact', to: 'static_pages#contact'	#,	as: 'contact'	

  get '/about/(:var)', to: 'static_pages#about', as: 'apropos'

  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end









