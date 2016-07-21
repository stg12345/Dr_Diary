class FollowersController < ApplicationController
#user => person being followed
#follower => person following user
before_action :confirm_logged_in #to prevent unauthorized access to pages

def show_followers
  @followers = Follower.followers(session[:user_id])
end

def view_users_to_follow
  following = Follower.following(session[:user_id]) #retrieving list of users already following logged in user.
 # all_users = User.where.not(session[:user_id])
  all_users = User.all
  all_users_id = specialize_userarray(all_users) 
  all_users_id.delete(session[:user_id])
  all_following_id = specialize_followingarray(following)
 
  
  @users_to_follow = all_users_id - all_following_id
end

def show_following
  @following = Follower.following(session[:user_id])
end

def check_follow_user
  
  @user = User.find(session[:user_id]) #user id of person logged in mentioned here
  
  #@user.follower_id << params[:user_id] #user id of follower mentioned here
  if !Follower.exists?(:follower_id =>@user.id , :user_id => params[:followee_id] ) #passing follower ID and User ID to check if follower already exists
    follow_user(params[:followee_id])
  elsif Follower.exists?(:follower_id =>@user.id , :user_id => params[:followee_id])
    puts "check_follow_user unfollow"
    unfollow_user(params[:followee_id])
  end
 
end

def follow_user(followee_id)
  @user = User.find(session[:user_id]) #user id of person logged in mentioned here
 #user id of follower mentioned here
  @follower = Follower.new(:user_id =>followee_id, :follower_id =>@user.id)
      if @follower.save
       redirect_to :action => 'view_users_to_follow'
      else
     #placeholder
      end 
end

def unfollow_user(followee_id)  
   if Follower.where(:user_id => followee_id,:follower_id => session[:user_id] ).delete_all
    redirect_to :action => 'show_following'
    flash[:notice] = "Unfollowed user"
  else
    render('view_users_to_follow')
  end
end

private

def follower_exists?(follower_id, user_id)
  if Follower.exists?(:follower_id => follower_id, :user_id => user_id)
    return true
  else
    return false
  end
end

def specialize_userarray(array)
  s_array = []
  array.each do |a|
    s_array << a.id
  end
  return s_array
end

def specialize_followingarray(array)
  s_array = []
  array.each do |a|
    s_array << a.user_id
  end
  return s_array
end

end
