class TracksController < ApplicationController
    def index
        @tracks = Track.all
        render json: @tracks 
    end
end
