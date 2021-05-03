class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name              #Playlist Name Concurrent with Spotify Name
      t.string :user_id           #Local Application User ID
      t.string :description       #Also pulled from Spotify
      t.string :spotifyPlaylistID #Spotify's unique ID 
      t.string :spotifyUserID     #Spotify Unique User ID
      t.integer :followers

      t.integer :likes, default: 0 # Local up-votes
      t.integer :dislikes, default: 0 #Local down-votes
      t.integer :views # Local views

      t.timestamps
    end
  end
end
