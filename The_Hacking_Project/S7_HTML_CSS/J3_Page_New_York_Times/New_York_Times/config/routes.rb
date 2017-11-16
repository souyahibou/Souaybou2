Rails.application.routes.draw do
  get "page/article",  to: "page#article"
  root "page#article"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
