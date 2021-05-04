#Usage of the gem is very similar to other OmniAuth strategies. Uses the shimmed keys from Figaro.rail
#Each scope value is a requested permission as per https://developer.spotify.com/documentation/general/guides/scopes/
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify,ENV["spotify_id"] , ENV["spotify_secret"], scope: %w(
      playlist-read-private
      user-read-private
      user-read-email
      user-top-read
      user-library-read
    ).join(' ')
  end