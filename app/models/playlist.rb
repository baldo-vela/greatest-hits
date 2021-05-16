class Playlist < ApplicationRecord
    belongs_to  :user
    has_many :tracks

    has_many :comments
    has_many :users, through: :comments
    
    validates :name, presence: true
    validates :spotifyPlaylistID, presence: true
    # RSpotify::Playlist.find_by_id('id', market: nil) -> Playlist
    # Today's Top 100
    # https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M

    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }
#
    def self.new_from_spotify(spotify_playlist, user_id = 2)
        #pass in an RSpotify playlist object
        #During seeding we assume Professor Reed is the User.all[1], but their Id is 2
        Playlist.new(
            name: spotify_playlist.name,
            user_id: user_id,
            description: spotify_playlist.description,
            spotifyPlaylistID: spotify_playlist.id,
            spotifyUserID: spotify_playlist.owner.id,
            followers: spotify_playlist.followers.count)
            
            #WIP, need to iterate though each track object, may need to pass additional arguments for proper ownership
            # spotify_playlist.tracks.each do |track|
            #    Track.create_from_spotify(track)
            # end        
            
    end

    def self.create_from_spotify(spotify_playlist)
        playlist = self.new_from_spotify(spotify_playlist)
        playlist.save
        Track.newTracks_from_playlist(playlist)
       
    end

# Spotify ID based Methods

    def self.find_from_spotify_id(spotify_id)
        # created to dry up seeding, and assist in building more complex methods
        return RSpotify::Playlist.find_by_id(spotify_id)

    end

    def self.create_from_spotify_id(spotify_id)
        self.
        self.find_from_spotify_id(spotify_id)

    #need a method that uses the RSpotify playlist.tracks array to instance new local track objects 
    end
end
