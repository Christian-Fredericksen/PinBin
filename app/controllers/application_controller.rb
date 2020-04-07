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
    if (params[:name]).empty? ||(params[:password]).empty?
      redirect to '/failure'
    else
    @user = User.find_by(params[:id])                  
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
    end   
  end

  get '/failure' do        
    erb :'pinbin'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  helpers do 

    def logged_in?
      !!session[:email]
    end

  end
end

  


