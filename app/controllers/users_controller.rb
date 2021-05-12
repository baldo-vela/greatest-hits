class UsersController < ApplicationController

    #New User creation
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Successfully signed up."
            session[:user_id] = @user.id
            
            redirect_to playlists_path
        else
            render :new
        end
    end

    def edit
        @user = User.find_by_id(params[:id])
    end

    def show
        #A user profile should show the user profile information and their owned associated objects
        @user = User.find_by_id(params[:id])
        @playlists = @user.playlists
        @comments = @user.comments
    end



    private
        def user_params
            #a simple DRY shim for user info
            params.require(:user).permit(:username, :password, :email)
        end
end
