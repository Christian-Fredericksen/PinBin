class PinsController < ApplicationController
    #CREATE
    get "/pins/new" do
        erb :'/pins/new'        
    end

    post "/new_pin" do
        if (params[:source]).empty? ||(params[:catagory]).empty? ||(params[:pin]).empty?
            redirect to '/pins/new'
        else
          @pin = Pin.create(:source => params[:source], :catagory => params[:catagory],
            :catagory_source => params[:catagory_source], :pin => params[:pin])
            pin= @pin.id        
            redirect "/collection/#{@pin.id}"
        end 

    end

    
    #READ
    
    get '/collection' do
        @pins = Pin.all
        erb :'/pins/index'
    end

    get '/collection/:id' do
        @pin = Pin.find(params[:id])
        erb :"/pins/show"
    end 

    get '/other_collectors/:id' do
        @user = User.find_by(params[:id])
        erb :"/pins/show"
    end

    get '/other_pins/:id' do
        @pin = Pin.find(params[:id])
        erb :"/pins/show"
    end
 
 end