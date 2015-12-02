class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :post, :through => :user
end
