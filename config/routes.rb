Rails.application.routes.draw do

  get 'user_events/new'
  post '/check_in', to: 'users#check_in'

  root 'application#home'
  get 'sessions/new'
  get 'venue/new'
  get 'events/new'

  get'/newevent', to: 'events#new'
  post '/newevent',  to: 'events#create'


  resources :users
  resources :venue
  resources :events
  resources :user_events do
    put :sort, on: :collection
  end

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'


  get  '/venue_signup',  to: 'venue#new'
  post '/venue_signup',  to: 'venue#create'
  delete '/venue_logout',  to: 'sessions#destroy'

  get    '/login',   to: 'sessions#new'
  get    '/venue_login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create_venue'
  delete '/logout',  to: 'sessions#destroy'

  get 'auth/:provider/callback' => 'sessions#create'
  get '/auth/google_oauth2', as: 'google_login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
