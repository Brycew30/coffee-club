class CoffeesController < ApplicationController

    get '/coffees' do
      @coffees = Coffee.all
      erb :"/coffees/index.html"
    end

    get '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      erb :"/coffees/show.html"
    end

    get '/coffees/:id/edit' do
      @coffee = Coffee.find(params[:id])
      erb :"/coffess/edit.html"
    end

end
