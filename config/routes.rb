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

  #Like and Dislike a Playlist WIP
  post '/playlists/:id/dislike', to: 'playlist#dislike', as: 'dislike_playlist'
  post '/playlists/:id/like', to: 'playlist#like', as: 'like_playlist'

  resources :tracks
  resources :playlists, only: [:new, :create, :destroy]
  #CUSTOM ROUTES to handle direct spotify import cludge
  get '/playlists/import', to: 'playlists#import', as: 'import_playlist'
  post '/playlists/import', to: 'playlists#spotify_create', as: 'spotify_import'

  resources :playlists do
    resources :comments, only: [:new, :create, :destroy]
    #New is just a placeholder form for handling serialzed Playlist objects when a spotify user signs in. 
    #Import is a custom route that will import a playlist and it's tracks from a public spotify ID key
    resources :tracks, only: [:index]
  end

  resources :users do
    resources :comments, only: [:index, :destroy]
    #just index and deletion for now, editing will probably be better handled with JS framework
    resources :playlists, only: [:index,:show, :new, :destroy]
    #show all user_playlists, show an individual one, allow them to create new ones, and delete existing lists they own
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
