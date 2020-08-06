class UsersController < ApplicationController

  get "/users" do
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
    @user = User.find_by(username: params[:username])
    erb :"/users/show.html"
  end

  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  patch "/users/:id" do
    redirect "/users/:id"
  end

  delete "/users/:id/delete" do
    redirect "/users"
  end
end
