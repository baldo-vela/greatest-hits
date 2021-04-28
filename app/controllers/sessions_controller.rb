class SessionsController < ApplicationController
    get '/signup' do
      redirect_if_logged_in
      erb :'sessions/signup'
    end
  
    post '/signup' do
      user = User.new(params[:user])
      if user.save
        session[:user_id] = user.id
        
      else
        redirect "/signup"
      end
    end
  
    get '/login' do
      redirect_if_logged_in
      erb :'sessions/login'
    end
  
    post '/login' do
      # we should see if user exist
       user = User.find_by_username(params[:user][:username])
  
      # if the user exist we should make sure they are using the correct password (authenticate them)
       if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        
       else
        redirect "/login"
       end
    end
  
    get '/logout' do
      session.clear
      redirect '/login'
    end
  end