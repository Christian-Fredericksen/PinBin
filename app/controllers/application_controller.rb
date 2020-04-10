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
  
  post '/login' do    
    if @user = User.find_by(params[:id])                  
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
    else
      redirect '/failure'
    end   
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

  


