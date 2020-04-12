require './config/environment'

class ApplicationController < Sinatra::Base  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end
  
  get "/" do
    erb:"/pinbin"
  end
  
  

  

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do 

    

    def current_user
      @user = User.find_by_id(session[:user_id])
    end


    # def logged_in?
    #   !!session[:user_id]
    # end

  end
end

  


