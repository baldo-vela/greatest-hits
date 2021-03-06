class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :spotify_id
      t.string :artists
      #t.string :img
      t.string :url
      t.string :preview
      t.belongs_to :playlist, foreign_key: true #Update this to polymorphic later

      t.timestamps
    end
  end
end
