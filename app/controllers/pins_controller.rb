class PinsController < ApplicationController

    get '/users_collection/:id' do
        @user = User.find(session[:user_id])
        erb :"/pins/show"
    end 
 
 end