class StaticPagesController < ApplicationController
  def home
  	@posts = Post.last(5)
  end

  def about
  end

  def contact
  end

end
