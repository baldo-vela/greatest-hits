class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    has_secure_password

    # user has many created playlists
    has_many :user_playlists, foreign_key: "user_id", class_name: "Playlist" 
    #This uses ActiveRecord to create an #user_playlist
    #Going to use this on the User #show page to list playlists they own 
    has_many :comments
    has_many :playlists, through: :comments
    # user has many playlists that they have left a comment on
    
    # has_many :tracks, thorough: :playlists 
    # a playlist has many tracks

    def playlists_from_spotify
        #Spotify Users have a unique ID
        #Rspotify Query t
    end
end
