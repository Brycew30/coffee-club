class SessionController < ApplicationController

  get '/login' do
    erb :"sessions/login.html"
  end


end
