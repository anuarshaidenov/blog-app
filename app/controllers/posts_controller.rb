class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comment = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @new_post = current_user.posts.new(post_params)
    @new_post.likes_counter = 0
    @new_post.comments_counter = 0
    @new_post.update_posts_counter
    if @new_post.save
      redirect_to post_path(@new_post)
    else
      render text: 'Could not save post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
