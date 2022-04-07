class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id)
    else
      render :new, alert: "An error has occurred while creating the post"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
