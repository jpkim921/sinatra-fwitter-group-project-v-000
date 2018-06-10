require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/user/homepage'
  end

  get '/signup' do

    erb :'/user/signup'
  end

  post '/signup' do

    if params.values.any?{|param| param == ""}
      redirect '/signup'
    else
      @user = User.create(params)
    end
    session[:id] = @user.id

    # binding.pry
    if logged_in?
      redirect '/tweets'
    else
      redirect '/login'
    end

  end

  get '/login' do
    erb :'/user/login'
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
