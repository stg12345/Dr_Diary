class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:login, :logout, :attempt_login]
  
  def index 
  end

  def login
    #flash[:notice] = "Please enter username and password."
  end

  def attempt_login
 if params[:username].present? && params[:password].present?
    found_user = User.where(:username => params[:username]).first
    #puts "attempting login"
   if found_user
    #puts "found user"
    authorized_user = found_user.authenticate(params[:password])
   end
        
  
   if authorized_user
     #puts "authorized user"
     session[:user_id] = authorized_user.id
     session[:username] = authorized_user.username
     flash[:notice] ="You are now Logged in"
     redirect_to(:action=> 'index')
   else
     #puts "wrong username password"
     flash[:notice] = "Wrong username/password combination"
     redirect_to(:action => 'login')
   end
   
   else
     #puts "Please enter username password"
     flash[:notice] = "Please enter username password"
     redirect_to(:action => 'login')
   end
 end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = "You are now logged out"
    redirect_to(:action => 'login')
  end
end
