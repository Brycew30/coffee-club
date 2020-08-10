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
    @user = User.new(params)
    if @user.save
      session[:user_id] = @user.id
      flash.next[:message] = "#{@user.name}, you successfully created an account! Welcome to Coffee Club!"
      redirect "/coffees"
    else
      flash.now[:error] = "Unable to create account: #{@user.errors.full_messages.to_sentence}."
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
