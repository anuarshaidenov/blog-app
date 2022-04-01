class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(1)
    @new_comment = @user.comments.new(
      text: comment_params,
      author_id: @user.id,
      post_id: @post.id
    )
    @new_comment.post_id = @post.id
    @new_comment.update_comments_counter
    if @new_comment.save
      redirect_to "/users/#{@post.author_id}/posts/#{@post.id}"
    else
      render text: 'Could not save post'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
