class CommentsController < ApplicationController
    before_action :comment_params, except:[:destroy]
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

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:message] = "Comment Deleted"
        redirect_to User.find(params[:user_id])
    end

    private
    def comment_params
        params.require(:comment).permit(:id, :body, :playlist_id, :user_id)
        #Double check :id in this method
    end
end
