require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "random_assortment_of_characters"
    register Sinatra::Flash #adds flash hash where key of message can be created and set
  end

  get "/" do
    if logged_in?
      redirect to "/users/#{current_user.id}"
    else
      erb :"/index.html"
    end
  end

  def redirect_if_logged_out
    if !logged_in?
      redirect to '/login'
    end
  end

  helpers do #can be used inside Views as well
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id]) #memoization
    end
  end

end
