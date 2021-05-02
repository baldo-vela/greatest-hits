class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.integer :user_id
      t.string :description
      t.string :spotifyPlaylistID
      t.string :spotifyUserID
      t.integer :followers

      t.integer :likes, default: 0 # Local up-votes
      t.integer :dislikes, default: 0 #Local down-votes
      t.integer :views # Local views

      t.timestamps
    end
  end
end
