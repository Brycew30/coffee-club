class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      flash.next[:message] = "#{current_user.name}, you're already logged in!"
      redirect to '/coffees'
    else
      erb :"sessions/login.html"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/coffees'
    else
      flash.next[:error] = "Login failed. Please try again."
      redirect to '/login'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    redirect to '/'
  end


end
