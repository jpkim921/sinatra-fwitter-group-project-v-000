require './config/environment'
require 'rack-flash'

class UserController < ApplicationController

  get '/' do
    erb :'/users/homepage'
  end

  get '/signup' do
    if logged_in?
      redirect '/tweets'
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

  # get '/login' do
  #
  #   if logged_in?
  #     redirect '/tweets'
  #   else
  #     erb :'/users/login'
  #   end
  # end
  #
  # post '/login' do
  #
  #   # redirect
  #   # erb :'/user/login'
  # end



  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end

end
