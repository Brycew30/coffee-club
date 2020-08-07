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
        flash.next[:error] = "You don't have permission to edit that coffee."
        redirect to '/coffees'
      end
    end

    post '/coffees' do
      redirect_if_logged_out
      @coffee = current_user.coffees.build(params)
      if @coffee.save
        flash.next[:message] = "Your coffee was successfully added to the list!"
        redirect to "/coffees/#{@coffee.id}"
      else
        flash.now[:error] = "Invalid input. Make sure all fields are completed."
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
        flash.next[:message] = "Your coffee was successfully updated!"
        redirect to "/coffees/#{@coffee.id}"
      else
        flash.next[:error] = "Please make sure all fields are filled."
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
