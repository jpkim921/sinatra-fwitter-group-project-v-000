require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/users/homepage'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/signup'
    elsif logged_in?
      redirect '/tweets'
    end
  end

  post '/signup' do

    # if params.values.any?{|param| param == ""}
    # if params[:username] == "" || params[:email] == "" || params[:password] == ""  
      redirect '/signup'
    else
      @user = User.create(params)
      session[:id] = @user.id
      # binding.pry
      redirect '/tweets'
    end
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
