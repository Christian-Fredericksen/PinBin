class PinsController < ApplicationController

    get '/collection/:id' do
        #@user = User.find(params[:id])
        erb :"/pins/show"
    end 
 
 end