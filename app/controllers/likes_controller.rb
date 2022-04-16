class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new(author: current_user, post: @post)

    if @like.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id)
    else
      render user_post_path(user_id: @post.author.id, post: @post.id),
             alert: 'An error has occurred while creating the like'
    end
  end
end
