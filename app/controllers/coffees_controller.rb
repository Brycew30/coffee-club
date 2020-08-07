class CoffeesController < ApplicationController

    get '/coffees' do
      redirect_if_logged_out
      @coffees = Coffee.all
      erb :"/coffees/index.html"
    end

    get '/coffees/new' do
      redirect_if_logged_out
      @coffee = Coffee.new
      erb :'coffees/new.html'
    end

    get '/coffees/:id' do
      redirect_if_logged_out
      set_coffee
      erb :"/coffees/show.html"
    end

    get '/coffees/:id/edit' do
      redirect_if_logged_out
      set_coffee
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
      redirect_if_logged_out
      set_coffee
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
      redirect_if_logged_out
      set_coffee
      @coffee.destroy if @coffee.user == current_user
      redirect to '/coffees'
    end

    private

    def set_coffee
      @coffee = Coffee.find(params[:id])
    end

end
