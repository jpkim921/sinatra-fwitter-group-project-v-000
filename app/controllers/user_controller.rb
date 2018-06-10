require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/users/homepage'
  end

  get '/signup' do
    binding.pry
      redirect '/tweets'
      if logged_in?
    else
      erb :'users/signup'
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
  end



  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      User.find(session[:id])
    end
  end

end
