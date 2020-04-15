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
            :catagory_source => params[:catagory_source], :pin => params[:pin], :user_id => current_user.id )
                  
            redirect "/pins/#{@pin.id}"

        end 

    end

    
    #READ
    
    get '/pins' do
        if !logged_in?
            redirect '/'
        else
        @pin = Pin.all        
        erb :'/pins/index'
        end
    end

    get '/my_pins' do
        # @pins = Pin.all
         @pin = current_user.pins
         erb :'/pins/my_pins'
     end

    get '/pins/:id' do
        @pin = Pin.find_by_id(params[:id])
        erb :"/pins/show"
    end 


    #UPDATE
    get "/pins/:id/edit" do
        @pin = Pin.find_by_id(params[:id])
        erb :'/pins/edit'
       end 
       
       patch "/pins/:id" do
         @pin = Pin.find_by_id(params[:id])
         @pin.update(source: params[:source], catagory: params[:catagory], catagory_source: params[:catagory_source], pin: params[:pin])
         redirect to "/pins/#{@pin.id}"
       end

       #DELETE   
       delete "/pins/:id" do
         @pin = Pin.find(params[:id])
         @pin = Pin.destroy(params[:id])
         redirect to "/pins"
       end
    
end  
 
