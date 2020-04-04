class PinsController < ApplicationController

   get '/collection' do
    @user = @user.name
    erb :/pins/show
   end 

   get '/collection/:id' do
    "Look at all those pins!"
   end 
    
end