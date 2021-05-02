class PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.all 
    end
    
    def show
        @playlist = Playlist.find(params[:id])
    end

    def new
        @playlist = Playlist.new
    end

    def create
        #WIP
        @playlist = Playlist.new(playlist_params)
        if @playlist.save
            redirect_to playlist_path(@playlist)
        else
            render :new
        end
    end

    #-----Helpers & Private Methods------
    private
    def playlist_params
        # params.require(:playlist).permit
    end
    
end
