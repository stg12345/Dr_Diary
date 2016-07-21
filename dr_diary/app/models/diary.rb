class Diary < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  scope :find_current_user_diary, lambda { |id| where('user_id = ?', id)}
  
  mount_uploader :diary_image, DiaryImageUploader
  
  validates :name, presence: true, length: {maximum: 50}
end
