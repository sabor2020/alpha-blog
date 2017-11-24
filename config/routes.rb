Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/index", to: "welcome#index"
  get "welcome/about", to: "welcome#about"

  root "welcome#index"

  resources :articles


end
