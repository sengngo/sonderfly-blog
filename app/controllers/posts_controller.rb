class PostsController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
	def index
  	@posts = Post.all.order('create_at DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
		@post.save
		if @post.valid?
			redirect_to post_path(@post)
		else
			render :new, :status => :unprocessable_entity
		end
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
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
		params.require(:post).permit(:title, :intro, :body, :cover_photo)
	end

end

