class Post < ActiveRecord::Base
	belongs_to :user
	validates :title, :intro, :body, :presence => true
end
