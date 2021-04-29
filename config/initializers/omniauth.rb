#Usage of the gem is very similar to other OmniAuth strategies. Uses the shimmed keys from Figaro.rail
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, Rails.application.credentials.spotify(ENV["spotify_id"]), Rails.application.credentials.spotify(ENV["spotify_secret"]), scope: %w(
      playlist-read-private
      user-read-private
      user-read-email
    ).join(' ')
  end