class TrackSerializer < ActiveModel::Serializer
  attributes :id, :name, :spotify_id, :img, :artist, :preview
end
