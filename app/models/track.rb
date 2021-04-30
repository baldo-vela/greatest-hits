class Track < ApplicationRecord
    # Associations
    belongs_to :playlist

    # Validations
        # track name
        # spotify e-id 

    # Scopes
    scope :search, -> (query) { self.where("title LIKE ?", "%#{query}%") }

    def self.create_from_spotify(track_sid)
        #Feed this a Spotify track external ID as a string
        # Example: https://open.spotify.com/track/3BZEcbdtXQSo7OrvKRJ6mb?si=4e6dc51b01d445ee
        # SEID: '3BZEcbdtXQSo7OrvKRJ6mb'
        #Check if it exists in DB
        #Else make the API call
            #RSpotify Get a track
            temp = RSpotify::Playlist.find("#{track_sid}", "")
            #pause if error in fetching
                #binding pry    
                #assign artist name
                #assign track name
                #assign preview url (WIP)
                #assign the spotify e-id
                
    end

end
