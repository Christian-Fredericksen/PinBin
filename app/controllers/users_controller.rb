class UsersController < ApplicationController
    # get "/users/signup" do
    #     erb :"/users/new"
    # end

    get "/users/signup" do
        erb :"/users/new"
    end

    post "/users/new" do
        @user = User.create(params[:user])       
        @user.save
        session[:user_id] = @user.id

        redirect '/users/home'          
    end

    get '/users/home' do
        @user = User.find(session[:user_id])
        erb :'/users/home'
    end

    get '/users/my_collection' do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end
    
    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'/users/home'
    end
end