class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
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
      flash[:notice] = 'Post created!'
      redirect_to post_path(@new_post)
    else
      flash.now[:error] = 'Could not save post'
      render action: 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
