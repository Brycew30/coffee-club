class SessionsController < ApplicationController

  get '/login' do
    erb :"sessions/login.html"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/coffees'
    else
      @error = "Username or password is incorrect"
      erb :'sessions/login.html'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/'
  end


end
