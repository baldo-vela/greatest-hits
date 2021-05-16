class CommentsController < ApplicationController
    before_action :comment_params
    #ensures that the private strong params method is always executed before any comment action

    def create
        @playlist = Playlist.find_by_id(params[:playlist_id])
        @comment = @playlist.comments.build(comment_params)
        @comment.user = current_user
        if @comment.save
            flash[:message] = "Comment Created"
            redirect_to playlist_path(@playlist)
        else
            flash[:message] = @comment.errors.full_messages
            @comments = @playlist.comments
            render :"playlists/show"
        end

    end

    private
    def comment_params
        params.require(:comment).permit(:body, :playlist_id, :user_id)
    end
end
