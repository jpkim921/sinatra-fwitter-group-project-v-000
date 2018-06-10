require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/user/homepage'
  end

  get '/signup' do

    erb :'/user/signup'
  end

  post '/signup' do
    @user = User.create(params)
    binding.pry
    # redirect '/tweets'
  end


end

# @user = Username.create(username: params["username"], email: params["email"], password: params["password"])
