class SessionsController < ApplicationController

  get '/sessions/new' do
    erb :"sessions/new.html"
  end

  post '/sessions' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/coffees'
    else
      @error = "Username or password is incorrect"
      erb :'sessions/new.html'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect to '/sessions/new'
  end


end
