class PlaylistsController < ApplicationController
    #Check if a user is logged in, then allow only #new, #create, & #update actions
    before_action :redirect_if_not_logged_in, only: [:new, :create, :update]

    def index
        @playlists = Playlist.all 
    end
    
    def show
        @playlist = Playlist.find(params[:id])
        #provides the set of comments to render
        @comments = @playlist.comments
        #preps for a new comment
        @comment = @playlist.comments.build(user_id: current_user.id)
        #sets the tracks to render
        @tracks = @playlist.tracks
        # WIP 
        #@playlist.update(views: @playlist.views+1)
    end

    def new
        @playlist = Playlist.new
        
    end
    def import
        #Ugh we'll use a manual form for now till slightly less jank import action works
        @playlist = Playlist.new(playlist_params)
    end

    def create
        #WIP
        byebug
        @playlist = Playlist.new(playlist_params)
        if @playlist.save
            redirect_to playlist_path(@playlist)
        else
            render :new
        end
    end

    def like
    def search
        @playlists = Playlist.search(params[:name])
        render :index
    end

    #-----Helpers & Private Methods------
    private
    def playlist_params
        params.require(:playlist).permit(:name, :user_id, :description, :spotifyPlaylistID, :spotifyUserID)
    end

    def find_playlist
        @playlist = Playlist.find_by_id(params[:playlist_id])
    end
    
end
