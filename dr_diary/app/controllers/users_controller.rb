class UsersController < ApplicationController
  before_action :confirm_logged_in, :except => [:new, :create]#to prevent unauthorized access to pages
  def new
    @user = User.new  
  end
  def create
    @user = User.new(user_params)
    
    if @user.valid?
      if @user.save
        redirect_to(:controller => 'access', :action => 'login')
      else
        flash[:notice] = "Error saving form, try again later"
        render('new')
      end
     else
       render('new')
     end
     
  end
  
  def list
    
  end
  
  def edit
    @user = User.find(session[:user_id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to(:controller => 'users', :action => 'list')
    else
      render('edit')
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name,:last_name,:password,:password_confirmation,:username,:email, :email_confirmation,:user_profile_picture)
  end
end
