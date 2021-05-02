class Track < ApplicationRecord
    # Associations
    belongs_to :playlist

    # Validations
        # track name
        # spotify e-id 

    # Scopes
    scope :search, -> (query) { self.where("name LIKE ?", "%#{query}%") }

    def self.new_from_spotify(spotify_track)
        #pass in a RSpotify track object to instance this class
        Track.new(
            name: spotify_track.name,
            spotify_id: spotify_track.id,
            artists: spotify_track.artists[0].name,
            img: spotify_track.album.images[0]["url"],
            preview: spotify_track.preview_url)  
    end

    def self.create_from_spotify(spotify_track)
        track = self.new_from_spotify(spotify_track)
        track.save
        return track
    end

end
