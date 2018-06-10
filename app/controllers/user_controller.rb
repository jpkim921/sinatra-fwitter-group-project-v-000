require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/user/homepage'
  end

  get '/signup' do

    erb :'/user/signup'
  end

  post '/signup' do
    @placeholder_params = params
    binding.pry
    erb :'/user/placeholder'
  end

  # get '/placeholder'

end
