class SessionController < ApplicationController

  get '/login' do
    erb :"sessions/login.html"
  end

  delete '/sessions' do
    session[:user_id] = nil
  end


end
