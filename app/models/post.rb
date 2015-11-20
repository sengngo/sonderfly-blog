class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :photos
	
	validates :title, :intro, :body, :presence => true
end
