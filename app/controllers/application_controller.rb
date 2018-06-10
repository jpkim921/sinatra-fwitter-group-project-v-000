require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    # need to have the two lines below to have access to the sessions hash
    enable :sessions
    set :session_secret, "secret"
  end


  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

  get '/' do
    erb :index
  end
end
