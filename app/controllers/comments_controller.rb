class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: params[:text], author: current_user, post: @post)

    if @comment.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id)
    else
      render user_post_path(user_id: @post.author.id, post_id: @post.id), alert: 'An error has occurred while creating the comment.'
    end
  end
end