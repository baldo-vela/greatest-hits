# Greatest Hits

A Ruby on Rails framework for gamifying Spotify user's playlists

This project was created in Ruby v2.6.1 with the Rails v6.0.0 framework. The final goal was to gameify user spotify playlists. First importing data from the Spotify API using the RSpotify wrapper gem. It instantiates the parsed data from the API with the gem as ruby hash structures. Then it iterates through the passed hashes to fill a one of the three local data container models that get pushed to the database running in SQLite3.
## Installation
Due to localization issues, this project was created with a depreciated version of Rails.
Download a copy of the source code to local machine. Run `bundle install` to prepare all the required Ruby gems. 
## Usage
This application requires the usage of the Spotify API through RSpotify as a wrapper. 

You will need to register and obtain your own Project Developer keys from Spotify: https://developer.spotify.com/dashboard/

Create or login to a Spotify account you would like to use as a developer. Follow the `Create an App` link (this may vary in the future according to Spotify's website.) Go into your new Spotify application settings. Note the `Client ID: 'foo'` and the `Show Client Secret` button--when pressed it will show your secret key. These two numerical values are the keys for your application, you will need to copy paste them in the next step.

Run `$bundle exec figaro install` inside the unpacked and initialized project directory in your terminal.
This will automatically create a commented `config/application.yml` file and automatically add it to your local `.gitignore` Add your Spotify dev keys to this file in the following format.
```ruby
spotify_id: "[YOUR ID KEY]"
spotify_secret: "[YOUR SECRET KEY]" 
```

Save the `application.yml` file, with the keys. Figaro will automatically shim those as environment variables when the RSpotify and Omniauth gems need them. 

Boot your Rails server, and enjoy.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Asset Attribution
Note: This was created using assets licensed under the Creative Commons Attribution 4.0 International license and requires compliance with the following: give appropriate credit, providing a link to the license(https://fontawesome.com/license), and used with little to no changes made. This application was created with no endorsement from the original creator, and the assets are contained in the dedicated `assets/fa` folder are are re-listed below with direct links:
    https://fontawesome.com/icons/eject?style=solid
    https://fontawesome.com/icons/file-audio?style=solid
    https://fontawesome.com/icons/music?style=solid
    https://fontawesome.com/icons/play-circle?style=solid
    https://fontawesome.com/icons/address-card?style=solid

## Licenses
https://fontawesome.com/license  
https://creativecommons.org/licenses/by/4.0/

