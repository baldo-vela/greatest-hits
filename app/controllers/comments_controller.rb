def create
    @playlist = Playlist.find_by_id(params[:playlist_id])
    @comment = @playlist.comments.build(comment_params)
    if @comment.save
        flash[:message] = "Comment Created"
        redirect_to playlist_path(@playlist)
    else
        flash[:message] = "There was an error leaving a comment"
        redirect_to playlist_path(@playlist)
    end

end

private
def comment_params
    params.require(:comment).permit(:content, :playlist_id, :user_id)
end
end
