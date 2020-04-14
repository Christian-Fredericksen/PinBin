class PinsController < ApplicationController
    #CREATE

    get "/new_pin" do
        erb :'/pins/new'        
    end

    post "/new_pin" do
        if (params[:source]).empty? ||(params[:catagory]).empty? ||(params[:pin]).empty?
            redirect to '/new_pin'
        else
          @pin = Pin.create(:source => params[:source], :catagory => params[:catagory],
            :catagory_source => params[:catagory_source], :pin => params[:pin])
            pin= @pin.id        
            redirect "/pins/#{@pin.id}"
        end 

    end

    
    #READ
    
    get '/pins' do
        @pins = Pin.all
        erb :'/pins/index'
    end

    get '/pins/:id' do
        @pins = Pin.find_by_id(params[:id])
        erb :"/pins/show"
    end 


    #UPDATE
    get "/pins/:id/edit" do
        @pins = Pin.find_by_id(params[:id])
        erb :'/pins/edit'
       end 
       
       patch "/pins/:id" do
         @pins = Pin.find_by_id(params[:id])
         @pins.update(name: params[:name], email: params[:email], password: params[:password])
         redirect to "/pins/#{@pins.id}"
       end

       #DELETE   
       delete "/pins/:id" do
         @pins = Pin.find(params[:id])
         @pins = Pin.destroy
         redirect to "/logout"
       end
    end
   
 
 end