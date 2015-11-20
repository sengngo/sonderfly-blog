class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_one :cover_photo
	
	validates :title, :intro, :body, :presence => true
	mount_uploader :cover_photo, CoverPhotoUploader
end
