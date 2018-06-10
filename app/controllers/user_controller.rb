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
      binding.pry
    end

    session[:id] = @user.id

    if 
    redirect '/tweets'
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
