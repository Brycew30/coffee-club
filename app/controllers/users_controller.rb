class UsersController < ApplicationController

  get "/users" do
    erb :"/users/index.html"
  end

  get '/signup' do
    erb :"users/sign_up.html"
  end

  post "/users" do
    redirect "/users"
  end

  get "/users/:id" do
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
