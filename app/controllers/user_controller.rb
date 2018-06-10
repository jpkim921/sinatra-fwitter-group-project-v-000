require './config/environment'

class UserController < ApplicationController

  get '/' do
    erb :'/users/homepage'
  end

  get '/signup' do
    # if !logged_in?
    #   erb :'users/signup'
    # elsif logged_in?
    #   redirect '/tweets'
    # end

    if !logged_in?
      erb :'users/signup'
    else
      redirect to '/tweets'
    end
  end

  post '/signup' do

    # if params.values.any?{|param| param == ""}
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect '/signup'
    else
      # @user = User.create(params)
      # session[:id] = @user.id
      # # binding.pry

      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id

      redirect '/tweets'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
#
