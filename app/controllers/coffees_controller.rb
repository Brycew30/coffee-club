class CoffeesController < ApplicationController

    get '/coffees' do
      redirect_if_logged_out
      @coffees = current_user.coffees
      erb :"/coffees/index.html"
    end

    get '/coffees/new' do
      redirect_if_logged_out
      @coffee = Coffee.new
      erb :'coffees/new.html'
    end

    get '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      if @coffee.user != current_user
        redirect to '/coffees'
      end
      erb :"/coffees/show.html"
    end

    get '/coffees/:id/edit' do
      @coffee = Coffee.find(params[:id])
      if @coffee.user == current_user
        erb :"/coffees/edit.html"
      else
        redirect to '/coffees'
      end
    end

    post '/coffees' do
      redirect_if_logged_out
      @coffee = current_user.coffees.build(params)
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
      if @coffee.user != current_user
        redirect to '/coffees'
      elsif @coffee.update(params)
        redirect to "/coffees/#{@coffee.id}"
      else
        @error = @coffee.errors.full_messages.first
        erb :'coffees/edit.html'
      end
    end

    delete '/coffees/:id' do
      @coffee = Coffee.find(params[:id])
      @coffee.destroy if @coffee.user == current_user
      redirect to '/coffees'
    end

end
