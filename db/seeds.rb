# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.all.empty?
    puts "Creating default Admin Account"
    User.create(username: "Admin", password: "test", email: "admin@emailfake.com")
    puts User.all[0]
    puts "Creating account for Professor Cane"
    User.create(username: "Professor Cane", password: "instrument", email: "DrRCane@greatesthits.com") 
    puts User.all[1]
else
    puts "Abort error: User Database Exists already"
end
    
#----Playlist Seeding----

# https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M
# Today's Top 100

# https://open.spotify.com/playlist/37i9dQZF1DWWMOmoXKqHTD
# Songs to Sing in the Car


# temp = RSpotify::Playlist.find_by_id('37i9dQZF1DXcBWIGoYBM5M')
# test = Playlist.new_from_spotify(temp)
if Playlist.all.empty?
    puts "Seeding playlists:"
    Starter_Playlists = 
        [   '37i9dQZF1DXcBWIGoYBM5M',
            '37i9dQZF1DWWMOmoXKqHTD',
            '3hoI0s5TLdpPMcimSRmQpj',
            '4sgUux9hmykyWYmVoe4W6p', 
            '0tKl4orQrCG2wbWPJjYg8k', 
        ]
    Starter_Playlists.each do |t|
        temp = RSpotify::Playlist.find_by_id(t)
        puts "Retrieved Playlist: #{temp.name}"
        test = Playlist.create_from_spotify(temp)
    end
    puts "Seeded #{Playlist.all.count} Playlists"
end

if Comment.all.empty?
    puts "Seeding Comments" 
    Playlist.all.each do |playlist|
        Comment.create(user_id: 2, playlist_id: playlist.id, body: "This playlist is fire, I should know. I'm Professor Cane!")
    end
    puts "Created #{Comment.all.count} Comments"
else
    puts "Comment system already contains data"
end
