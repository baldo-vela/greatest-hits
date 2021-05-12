class SessionsController < ApplicationController
  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      flash[:message] = "Logged in"
      session[:user_id] = @user.id
      redirect_to playlists_path
    else
      flash[:message] = "Please check your Username and Password"
      render :new
    end
  end

  def logout
    session.clear
    redirect_to welcome_path
  end

  def omniauth
    flash[:ommiauth_spotify_force_approval?]
    @user = User.find_or_create_by(username: auth[:info][:nickname]) do |u|
      
      u.email = auth[:info][:email]
      u.username = auth[:info][:nickname]
      #u.name = auth[:info][:name]
      #OAuth Hash seems to be missing the Spotify User ID
      #u.uid = auth[:id]
      #Alternative build a helper method to RSpotify query for a more detailed user hash and assign the UID from that
      u.provider = auth[:provider]
      u.password = SecureRandom.hex(12)
    end
    #byebug
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
=begin
The username/nickname is also available via a call to request.env['omniauth.auth'].uid
Information about the authorized Spotify user is available in the request.env['omniauth.auth'].info hash. e.g.       
    :name => "Claudio Poli",
    :nickname => "SomeName",
    :email => "claudio@icorete.ch",
    :urls => {"spotify" => "https://open.spotify.com/user/1111111111"},
    :image => "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfp1/t1.0-1/s320x320/301234_1962753760624_625151598_n.jpg",
    :birthdate => Mon, 01 Mar 1993, # Date class
    :country_code => "IT",
    :product => "open",
    :follower_count => 10 \
=end

end