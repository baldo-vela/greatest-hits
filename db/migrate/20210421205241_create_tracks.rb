class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :spotify_id
      t.string :artists
      t.string :img
      t.string :url
      t.string :preview
      t.references :playlist_id

      t.timestamps
    end
  end
end
