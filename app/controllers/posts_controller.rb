class PostsController < ApplicationController
  def index
    @users = User.find(params[:user_id])
    @posts = @users.posts
  end

  def show
    @post = Post.find(params[:id])
    @users = @post.author
    @comments = @post.comments
  end
end
