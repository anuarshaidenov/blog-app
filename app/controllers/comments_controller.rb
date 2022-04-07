class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to user_post_path(user_id: @comment.author.id, id: @comment.post.id)
    else
      render user_post_path(user_id: @comment.author.id, id: @comment.post.id),
             alert: 'An error has occurred while creating the comment.'
    end
  end

  private

  def comment_params
    params.permit(:text, :post_id)
  end
end
