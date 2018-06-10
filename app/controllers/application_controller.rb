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
    def current_user
      @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end

  get '/' do
    erb :index
  end
end
