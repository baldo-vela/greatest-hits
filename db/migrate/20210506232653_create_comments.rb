class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :user_id      #foreign key to local user
      t.integer :playlist_id  #the local playlist id
      t.text :body            #the actual content

      t.timestamps
    end
  end
end
