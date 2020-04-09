class PinsController < ApplicationController
    #CREATE
    get "/pins/new" do
        erb :'/pins/new'        
    end

    post "/new_pin" do
        if (params[:name]).empty? ||(params[:email]).empty? ||(params[:password]).empty?
            redirect to '/failure'
        else
          @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])                  
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        end 

    end

    # post "/new_pin" do
    #     if (params[:source]).empty? ||(params[:catagory]).empty? ||(params[:pin]).empty?
    #         redirect to '/failure'
    #     else
    #       @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])                  
    #       session[:user_id] = @user.id
    #       redirect "/users/#{@user.id}"
    #     end

    # end










    #READ
    
    get '/collections' do
        erb :'/pins/index'
    end

    get '/my_collection' do
        @user = User.find(session[:user_id])
        erb :"/pins/show"
    end 

    get '/other_collections/:id' do
        @user = User.find_by(params[:id])
        erb :"/pins/show"
    end
 
 end