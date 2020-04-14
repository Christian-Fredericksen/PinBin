

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



    



















#     get "/create_account" do
#         erb :'/users/new'
#     end

    

#     get '/failure' do        
#         erb :'pinbin'
#     end

#     get '/login/:id' do
#         @user = session[:email]
#         if @user.logged_in?
#         erb :'/users/show'
#         else erb:'/pinbin'
#         end        
#     end 

#     post '/login/:id' do 
#         if (params[:name]).empty? || (params[:password]).empty?
#             redirect '/failure'
#         else
#         @user = User.find_by(params[:name])
#         @user.authenticate(params[:name])
#             session[:user_id] = @user.id
#             redirect '/users/:id'
#         end

#     end


#     #READ
    

         
    
    
#     #UPDATE
#     get '/users/:id/edit' do
#         @user = User.find(session[:user_id])
#         erb :'/users/edit'
#     end

#     patch '/users/:id' do #edit action
#         @user = User.find(session[:user_id])
#         @user.name = params[:name]
#         @user.email = params[:email]
#         @user.save
#         redirect to "/users/#{@user.id}"
#       end

#     #DELETE
#     delete '/users/:id' do #delete action
#         @users = User.find_by_id(params[:id])
#         @users.delete
#         redirect to '/users'
#     end
    

