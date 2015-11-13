class UsersController < ApplicationController
	#before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def dashboard
  	@user = User.find(current_user.id)
  	@posts = @current_user.posts
  #	@posts = Post.all.find(current_user.id)
  end



end
