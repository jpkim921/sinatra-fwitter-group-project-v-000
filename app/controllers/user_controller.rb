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

    # binding.pry
    redirect '/tweets'
  end


end

# @user = Username.create(username: params["username"], email: params["email"], password: params["password"])
