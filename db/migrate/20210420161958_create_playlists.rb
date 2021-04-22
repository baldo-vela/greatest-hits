class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.string :SpotifyPlaylistID
      t.string :SpotifyUserID
      t.array :tracks
      t.integer :followers

      t.timestamps
    end
  end
end
