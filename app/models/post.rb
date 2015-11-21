class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_one :cover_photo
	
	validates :title, :presence => true, length: { minimum: 2 }
	validates :intro, :body, :presence => true

	mount_uploader :cover_photo, CoverPhotoUploader
end
