class Playlist < ApplicationRecord
    belongs_to  :user
    has_many :tracks
    
    validates :name, presence: true
    # RSpotify::Playlist.find_by_id('id', market: nil) -> Playlist
    # Today's Top 100
    # https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M

    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

    def self.new_from_spotify(spotify_playlist, user_id = 1)
        #pass in an RSpotify playlist object
        #During seeding we assume Professor Reed is the user
        Playlist.new(
            name: spotify_playlist.name,
            user_id: user_id,
            description: spotify_playlist.description,
            spotifyPlaylistID: spotify_playlist.id,
            spotifyUserID: spotify_playlist.owner.id,
            followers: spotify_playlist.followers.count)        
            
    end

    def self.create_from_spotify(spotify_playlist)
        playlist = self.new_from_spotify(spotify_playlist)
        playlist.save
        return playlist
    end

    #need a method that uses the RSpotify playlist.tracks array to instance new local track objects 

end
