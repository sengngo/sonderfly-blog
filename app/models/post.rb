class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	
	validates :title, :intro, :body, :presence => true
end
