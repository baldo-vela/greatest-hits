Rails.application.routes.draw do
  #Root
  root('static#welcome')

  #Signup
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  #App Log-in & Log-out
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: "sessions#logout"

  #Spotifiy Callback
  get '/auth/spotify/callback', to: 'sessions#omniauth'
  get '/search', to: 'playlists#search', as: 'search'

  resources :tracks
  resources :playlists do
    resources :comments, only: [:new, :create, :delete]
    resources :tracks, only: [:index]
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
