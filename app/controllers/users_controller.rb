class UsersController < ApplicationController

  get "/users" do
    @users = User.all
    erb :"/users/index.html"
  end

  get '/signup' do
    erb :"users/signup.html"
  end

  post "/users" do
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      redirect "/coffees"
    else
      @error = @user.errors.full_messages.first
      erb :"users/signup.html"
    end
  end

  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    @coffees = Coffee.all
    erb :"/users/show.html"
  end

end
