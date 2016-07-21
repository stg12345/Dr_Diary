class Post < ActiveRecord::Base
  belongs_to :diary
  belongs_to :user
  
  scope :find_post_for_current_user, lambda {|id| where('user_id = ?', id) }
  scope :find_post_in_current_diary, lambda {|id| where('diary_id = ?', id) }
  
  mount_uploaders :post_pictures, PostPicturesUploader
  
  validates :title, presence: true, length: {maximum: 50}
  
end
