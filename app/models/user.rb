class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    has_secure_password

    # user has many playlists
    has_many :playlists, foreign_key: "user_id", class_name: "Playlist" 
    has_many :tracks, thorough: :playlists 
    # a playlist has many tracks
end
