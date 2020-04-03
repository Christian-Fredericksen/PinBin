class UsersController < ApplicationController
    #CREATE    
    get "/signup" do
        erb :'/users/signup'
    end

    post "/signup" do
        
        if params[:name] == ""  || params[:email] == ""  || params[:password] == ""
            redirect "/failure"
        else
          @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])          
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        end   
    end

    get '/failure' do
        erb :'/users/signup'
    end

    #READ
    get '/users' do 
        @users = User.all
        erb :'/users/index' 
    end

    get '/users/:id' do 
        @user = User.find(session[:user_id])
        erb :'/users/show'
    end 
    
    #UPDATE
    get '/users/:id/edit' do
        @user = User.find(session[:user_id])
        erb :'/users/edit'
    end
    

end