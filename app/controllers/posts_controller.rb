class PostsController < ApplicationController
  skip_before_action :authenticate_request

  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id), notice: 'Post was successfully created!'
    else
      render :new, alert: 'An error has occurred while creating the post'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @author = @post.author
    @author.decrement!(:posts_counter)
    @post.destroy!
    redirect_to user_posts_path(id: @author.id), notice: 'Post was deleted successfully!'
  end

  def posts
    user = User.find(params[:user_id])

    respond_to do |format|
      format.json { render json: user.posts }
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
