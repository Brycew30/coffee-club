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


  helpers do #can be used inside Views as well

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id]) #memoization
    end

    def redirect_if_logged_out
      if !logged_in?
        flash.next[:error] = "Please login or signup to view that content."
        redirect to '/'
      end
    end

    def check_correct_user
      if @coffee.user != current_user
        flash.next[:error] = "You don't have permission to edit that coffee."
        redirect to '/coffees'
      end
    end

  end

end
