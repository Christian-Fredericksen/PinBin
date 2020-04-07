class PinsController < ApplicationController

    get '/my_collection' do
        @user = User.find(session[:user_id])
        erb :"/pins/show"
    end 

    get '/other_collections/:id' do
        @user = User.find_by(params[:id])
        erb :"/pins/show"
    end
 
 end