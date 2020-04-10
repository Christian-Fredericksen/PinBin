

class UsersController < ApplicationController
     
    #CREATE    
    get '/users' do         
        @users = User.all      
        erb :'/users/index'
    end

    get "/create_account" do
        unless current_user            
            @user = User.new
            erb :'users/new'
        else
            redirect "/users/show"
        end
    end

    post "/new_user" do        
        if (params[:name]).empty? ||(params[:email]).empty? ||(params[:password]).empty?
            redirect to '/failure'
        else
          @user = User.create(:name => params[:name], :email => params[:email], :password => params[:password])                  
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        end   
    end

    get '/failure' do        
        redirect '/'
      end

    get '/users/:id' do 
        @user = User.find(params[:id])
        erb :'/users/show'
    end

    get "/users/:id/edit" do
        @user = User.find(params[:id])
        erb :'/users/edit'
       end 
       
       patch "/users/:id" do
         @user = User.find(params[:id])
         @user.update(name: params[:name], email: params[:email], password: params[:password])
         redirect to "/users/#{@user.id}"
       end
       
       delete "/users/:id" do
         @user = User.find(session[:user_id])
         session.clear
         @user = User.destroy(params[:id])
         redirect to "/logout"
       end
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
    

