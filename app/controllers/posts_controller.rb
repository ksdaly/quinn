class PostsController < ApplicationController

  def index
    @posts = Post.where(user: current_user)
  end
end
