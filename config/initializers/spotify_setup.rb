#Configures the RSpotify gem with the Figaro shimmed and hidden keys from `root/application.yml`
RSpotify::authenticate(ENV["spotify_id"], ENV["spotify_secret"])