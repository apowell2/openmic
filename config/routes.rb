Rails.application.routes.draw do


  root 'application#home'
  get 'sessions/new'
  get 'venue/new'

  resources :users
  resources  :venue

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get  '/venue_signup',  to: 'venue#new'
  post '/venue_signup',  to: 'venue#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
