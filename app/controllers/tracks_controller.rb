class TracksController < ApplicationController
    def index
        if params[:playlist_id] 
            @tracks = Playlist.find(params[:playlist_id]).tracks
        else
            @tracks = Track.all
        end
        #byebug
        #render json: @tracks 
    end

    def show
        @track = Track.find(params[:id])
    end

    def new
        @track = Track.new
    end

    private
    def get_track
        @track = Track.find_by(id: params[:id])
    end
end
