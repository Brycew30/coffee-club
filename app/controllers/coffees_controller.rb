class CoffeesController < ApplicationController

    get '/coffees' do
      @coffees = Coffee.all
      erb :"/coffees/index.html"
    end

    get '/coffees/new' do
      erb :'coffees/new.html'
    end

    get '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      erb :"/coffees/show.html"
    end

    get '/coffees/:id/edit' do
      @coffee = Coffee.find(params[:id])
      erb :"/coffees/edit.html"
    end

    post '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      if @coffee.update(params)
        redirect to "/coffees/#{@coffee.id}"
      else
        @error = @coffee.errors.full_messages.first
        erb :'coffees/edit.html'
      end
    end

end
