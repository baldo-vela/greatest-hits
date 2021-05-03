class TracksController < ApplicationController
    def index
        @tracks = Track.all
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
