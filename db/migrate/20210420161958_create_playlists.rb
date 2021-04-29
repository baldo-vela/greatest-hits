class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.string :SpotifyPlaylistID
      t.string :SpotifyUserID
      t.integer :followers

      t.integer :score # Local votes
      t.integer :views # Local views

      t.timestamps
    end
  end
end
