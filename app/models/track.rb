class Track < ApplicationRecord
    # Associations
    belongs_to :playlist

    # Validations
        # track name
        # spotify e-id 

    # Scopes
    scope :search, -> (query) {self.where("title LIKE ?", "%#{query}%")}

    def CreateFromSpotify(track_seid)
        #Check if it exists in DB
        #Else make the API call
            #RSpotify Get a track
            #pause if error in fetching
                #binding pry    
                #assign artist name
                #assign track name
                #assign preview url (WIP)
                #assign the spotify e-id
                


    end

end
