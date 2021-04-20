class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.array :tracks
      t.integer :followers

      t.timestamps
    end
  end
end
