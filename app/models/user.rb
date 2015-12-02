class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :relationships, class_name:  "Relationship",
                          foreign_key: "follower_id",
                          dependent:   :destroy

  has_many :posts
  has_many :photos

  def full_name
  	'#{first_name} + #{last_name}'
  end
end
