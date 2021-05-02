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
    

# https://open.spotify.com/playlist/37i9dQZF1DXcBWIGoYBM5M
# Today's Top 100