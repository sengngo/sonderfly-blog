class StaticPagesController < ApplicationController
  def home
  	@posts = Post.last(5)
  end

  def about
  end

  def contact
  end

  
end


#To create and edit pages?
#  def new
#  end

#  def edit
#  end

# def update
# end


#to edit pages?
#  	if @page.user != admin_user
# 		return render :text => 'Not Allowed', :status => #:forbidden
#	end