require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "change_this_later"
  end

  get "/" do
    erb :"/index.html"
  end

  def redirect_if_logged_out
    if !signed_in?
      redirect to '/sessions/new'
    end
  end

  helpers do #can be used inside Views as well
    def signed_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id]) #memoization
    end
  end

end
