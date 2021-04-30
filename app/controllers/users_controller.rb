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
            # WIP
            # redirect_to
        else
            render :new
        end
    end

    private
        def user_params
            #a simple DRY shim for user info
            params.require(:user).permit(:username, :password, :email)
        end
end
