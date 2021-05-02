class TracksController < ApplicationController
    def index
        @tracks = Track.all
        render json: @tracks 
    end

    private
    def get_track
        @track = Track.find_by(id: params[:id])
    end
end
