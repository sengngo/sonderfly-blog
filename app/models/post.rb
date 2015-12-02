class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

#	default_scope { where(published: true)}

#	scope :published, -> { where(published: ture)}
end

