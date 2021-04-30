class Playlist < ApplicationRecord
    belongs_to  :user
    has_many :tracks
    
    validates :name, presence: true
    # RSpotify::Playlist.find_by_id('id', market: nil) -> Playlist
    # Today's Top 100
    # https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M

end
