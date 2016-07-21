class User < ActiveRecord::Base
  
  REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  #Adding Secure authentication and password encryption features
  has_secure_password
  has_many :diaries
  has_many :posts
  
 #-------------------------
  has_and_belongs_to_many(:users,
  :join_table => "followers",
  :foreign_key => "user_id",
  :association_foreign_key => "follower_id")
 #-------------------------
 
 # has_and_belongs_to_many :followers 
 #-------------------------------------
 validates_presence_of :first_name
 validates :first_name, length: {maximum: 20} 
 validates_presence_of :last_name
 validates :last_name, length: {maximum: 20} 
 validates :username, presence: true, uniqueness: true, length: 4..20
 validates :email,presence: true, uniqueness: true, format: REGEX
 validates_confirmation_of :email, :message => "Emails donot match"
 validates :password, length: 6..20
 validates_presence_of :password, :message => "Do not leave the password field blank"
 validates_confirmation_of :password,:message => "Passwords donot match"
 #-------------------------------------
  
  #uploader for uploading user profile pictures
  mount_uploader :user_profile_picture, UserProfilePictureUploader
end
