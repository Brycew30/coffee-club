class CoffeesController < ApplicationController

    get '/coffees' do
      @coffees = Coffee.all
      erb :"/coffees/index.html"
    end

    get '/coffees/new' do
      @coffee = Coffee.new
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

    post '/coffees' do
      @coffee = Coffee.new(params)
      if @coffee.save
        redirect to "/coffees/#{@coffee.id}"
      else
        @error = @coffee.errors.full_messages.first
        erb :"coffees/new.html"
      end
    end

    patch '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      params.delete(:_method) #hidden input added _method key to params
      if @coffee.update(params)
        redirect to "/coffees/#{@coffee.id}"
      else
        @error = @coffee.errors.full_messages.first
        erb :'coffees/edit.html'
      end
    end

    delete '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      @coffee.destroy
      redirect to '/coffees'
    end

end
