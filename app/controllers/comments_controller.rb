class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to user_post_path(id: @comment.post.id),
                  notice: 'Comment was successfully created!'
    else
      render user_post_path(id: @comment.post.id),
             alert: 'An error has occurred while creating the comment.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @post.decrement!(:comments_counter)
    @comment.destroy!
    redirect_to user_post_path(id: @post.id), notice: 'Comment was successfully deleted!'
  end

  private

  def comment_params
    params.permit(:text, :post_id)
  end
end
