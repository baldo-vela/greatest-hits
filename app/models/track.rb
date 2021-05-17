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

    def self.new_from_spotify(spotify_track, playlist_id = nil)
        #pass in a RSpotify track object to instance this class
=begin  "name"
        "spotify_id"
        "artists"
        "img"
        "url"
        "preview" 
=end
        Track.new(
            name: spotify_track.name,
            spotify_id: spotify_track.id,
            artists: spotify_track.artists[0].name,
            img: spotify_track.album.images[0]["url"],
            url: spotify_track.external_urls[0],
            preview: spotify_track.preview_url)  
    end

    def self.create_from_spotify(spotify_track, playlist_id = nil)
        track = self.new_from_spotify(spotify_track)
        track.save
        return track
    end

    def self.newTracks_from_playlist(playlist)
        #Take passed playlist hash create local track objects
        playlist.tracks.each do |track|
            Track.new_from_spotify(track)
        end
    end

    def self.createTracks_from_playlist(playlist)
        self.newTracks_from_playlist(playlist)
    end

end
