

class UsersController < ApplicationController
     
    #CREATE    
    
    get "/new_user" do
        if !logged_in?
            erb :'users/new'
        else
            @user = current_user
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    post "/new_user" do        
        if (params[:name]).empty? ||(params[:email]).empty? ||(params[:password]).empty?
            redirect to '/new_user'
        else
          @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])                  
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        end   
    end

    #READ
    get '/users/:id' do 
        @user = User.find_by_id(params[:id])

        erb :'/users/show'
    end

    get '/users' do         
        @users = User.all      
        erb :'/users/index'
    end

    #UPDATE
    get "/users/:id/edit" do
        @user = User.find(params[:id])
        erb :'/users/edit'
       end 
       
       patch "/users/:id" do
         @user = User.find(params[:id])
         @user.update(name: params[:name], email: params[:email], password: params[:password])
         redirect to "/users/#{@user.id}"
       end

       #DELETE   
       delete "/users/:id" do
         @user = User.find(params[:id])
         @user = User.destroy
         redirect to "/logout"
       end
    




    get '/login' do
        if !logged_in?
            erb :'/users/login'
        else
            @user = current_user
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    post '/login' do        
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])            
            session[:user_id] = @user.id            
            redirect "/users/#{@user.id}"            
        else                
            redirect '/'            
        end
    end
    
    get '/logout' do
        session.clear
        redirect '/'
    end
end



