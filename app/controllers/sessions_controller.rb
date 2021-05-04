class SessionsController < ApplicationController
  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @usser.authenticate(params[:user][:password])

  end

  def logout
    session.clear
    redirect_to login_path
  end

  def omniauth
    @user = User.find_or_create_by(username: auth[:info][:email]) do |u|
      u.email = auth[:info][:email]
      u.username = auth[:info][:email]
      u.name = auth[:info][:name]
      u.uid = auth[:uid]
      u.provider = auth[:provider]
      u.password = SecureRandom.hex(12)
    end
    
    if @user.valid?
        flash[:messsage] = "Signed in with Spotify"
        session[:user_id] = @user.id
        redirect_to playlists_path
    else
        flash[:message] = "Credential error"
        redirect_to login_path
    end
  end

  private

    def auth
      request.env['omniauth.auth']
    end

end