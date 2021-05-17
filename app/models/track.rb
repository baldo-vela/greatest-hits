class Track < ApplicationRecord
    # Associations
    # A track may belong to many playlists
    belongs_to :playlist

    # Validations
    validates :name, presence: true
        #Prevents blank playlist names
    validates :spotify_id, presence: true
        #must have a spotify ID, which WIP can be used to pull additional information from RSpotify later if needed.

    # Scopes
    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

    def self.new_from_spotify(spotify_track, passedplaylist_id = nil)
        #pass in a RSpotify track object to instance this class
        #byebug
        Track.new(
            name: spotify_track.name,
            spotify_id: spotify_track.id,
            artists: spotify_track.artists[0].name,
            #img: spotify_track.albums[0].images[0]["url"],
            url: spotify_track.external_urls,
            preview: spotify_track.preview_url,
            playlist_id: passedplaylist_id)  
    end

    def self.create_from_spotify(spotify_track, playlist_id = nil)
        track = self.new_from_spotify(spotify_track, playlist_id)
        track.save
        
    end

    def self.newTracks_from_playlist(spotify_playlist, passed_playlist_id)
        #Take passed playlist hash create local track objects
        spotify_playlist.tracks.each do |track|
            #byebug
            Track.create_from_spotify(track, passed_playlist_id)
        end
    end

    def self.createTracks_from_playlist(playlist)
        self.newTracks_from_playlist(playlist)
    end

end
