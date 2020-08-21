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
      check_correct_user
        erb :"/coffees/edit.html"
    end

    post '/coffees' do
      redirect_if_logged_out
      @coffee = current_user.coffees.build(params)
      if @coffee.save
        flash.next[:message] = "Your coffee was successfully added to the list!"
        redirect to "/coffees/#{@coffee.id}"
      else
        flash.now[:error] = "Unable to create coffee: #{@coffee.errors.full_messages.to_sentence}."
        erb :"coffees/new.html"
      end
    end

    patch '/coffees/:id' do
      redirect_if_logged_out
      set_coffee
      params.delete(:_method) #hidden input added _method key to params
      check_correct_user
      if @coffee.update(params)
        flash.next[:message] = "Your coffee was successfully updated!"
        redirect to "/coffees/#{@coffee.id}"
      else
        flash.next[:error] = "Unable to update coffee: #{@coffee.errors.full_messages.to_sentence}."
        erb :'coffees/edit.html'
      end
    end

    delete '/coffees/:id' do
      redirect_if_logged_out
      set_coffee
      @coffee.destroy if @coffee.user == current_user
      flash.next[:message] = "Your coffee was successfully deleted from the list."
      redirect to '/coffees'
    end

    private

    def set_coffee
      @coffee = Coffee.find(params[:id])
    end

end
