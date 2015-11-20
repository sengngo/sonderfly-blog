class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	def index
  	@posts = Post.all
	end

	def new
		@post = Post.new
		@photo = Photo.new
	end

	def create
		@post = current_user.posts.create(post_params)
		if @post.valid?
			redirect_to post_path(@post)
		else
			render :new, :status => :unprocessable_entity
		end

		@photo = current_user.photo.create(photo_params)
		if @photo.valid?
			redirect_to post_path(@post)
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
		@photo = Photo.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])

		if @post.user != current_user
    	return render :text => 'Not Allowed', :status => :forbidden
  	end

	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		if @post.user != current_user
			return render :text => 'Not Allowed', :status => :forbidden
		end

		if @post.valid?
    	redirect_to post_path(@post)
  	else
    	render :edit, :status => :unprocessable_entity
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

	def photo_params
		params.require(:photo).permit(:caption)
	end
end

