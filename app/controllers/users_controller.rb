class UsersController < ApplicationController

  get "/users" do
    redirect_if_logged_out
    @users = User.all
    erb :"/users/index.html"
  end

  get '/signup' do
    if logged_in?
      redirect to '/coffees'
    else
      erb :"/users/signup.html"
    end
  end

  post "/signup" do
    if params[:name] != "" && params[:username] != "" && params[:password] != ""
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      flash.next[:message] = "Welcome to Coffee Club, #{@user.name}!"
      redirect "/coffees"
    else
      flash.now[:error] = "Invalid input. Please make sure all fields are completed."
      erb :"users/signup.html"
    end
  end

  get "/users/:id" do
    redirect_if_logged_out
    @user = User.find_by(id: params[:id])
    @coffees = Coffee.all
    erb :"/users/show.html"
  end

end
