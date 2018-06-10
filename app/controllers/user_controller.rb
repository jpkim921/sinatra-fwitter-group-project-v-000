require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/users/homepage'
  end

  get '/signup' do
    binding.pry
    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/tweets'
    end
  end

  post '/signup' do

    if params.values.any?{|param| param == ""}
      redirect '/signup'
    else
      @user = User.create(params)
      session[:id] = @user.id
      redirect '/tweets'
    end

    # binding.pry
    # if logged_in?
    #   redirect '/tweets'
    # else
    #   redirect '/login'
    # end

  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    # erb :'/user/login'
  end



  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end

end
