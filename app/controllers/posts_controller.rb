class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	def index
  	@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		current_user.posts.create(post_params)
		redirect_to root_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])

		if @post.user != current_user
    	return render :text => 'Not Allowed', :status => :forbidden
  	end
	end

	def update
		@post = Post.find(params[:id])
		if @post.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end
		@post.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :intro, :body)
	end
end

