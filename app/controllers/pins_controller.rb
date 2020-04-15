class PinsController < ApplicationController
    #CREATE

    get "/new_pin" do
        erb :'/pins/new'        
    end

    post "/new_pin" do
        if (params[:source]).empty? ||(params[:catagory]).empty? ||(params[:pin]).empty? 
             redirect to '/new_pin'
        else 
          @pins = Pin.create(:source => params[:source], :catagory => params[:catagory],
            :catagory_source => params[:catagory_source], :pin => params[:pin], :user_id => current_user.id )
                  
            redirect "/pins/#{@pins.id}"

        end 

    end

    
    #READ
    
    get '/pins' do
        @pins = Pin.all        
        erb :'/pins/index'
    end

    get '/my_pins' do
        # @pins = Pin.all
         @pins = current_user.pins
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
         @pins.update(source: params[:source], catagory: params[:catagory], catagory_source: params[:catagory_source], pin: params[:pin])
         redirect to "/pins/#{@pins.id}"
       end

       #DELETE   
       delete "/pins/:id" do
         @pins = Pin.find(params[:id])
         @pins = Pin.destroy(params[:id])
         redirect to "/pins"
       end
    
end  
 
