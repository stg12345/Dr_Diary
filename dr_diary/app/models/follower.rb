class Follower < ActiveRecord::Base
  
  scope :followers, lambda{|id| where('user_id = ?',id)}
  scope :following, lambda{|id| where('follower_id = ?',id)}
   
end
