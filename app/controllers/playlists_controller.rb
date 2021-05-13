class PlaylistsController < ApplicationController
    def index
        @playlists = Playlist.all 
    end
    
    def show
        @playlist = Playlist.find(params[:id])
        @comments = @playlist.comments
        @comment = @playlist.comments.build(user_id: current_user.id)
        #@playlist.update(views: @playlist.views+1)
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
