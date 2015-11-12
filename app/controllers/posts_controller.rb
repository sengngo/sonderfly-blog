class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
  	@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		current_user.places.create(post_params)
		redirect_to root_path
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to root_path
	end

	def destory
		@post = Post.find(params[:id])
		@place.destroy
		redirect_to root_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :intro, :body)
	end
end

