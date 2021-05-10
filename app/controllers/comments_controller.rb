class CommentsController < ApplicationController
  before_action :set_post, only:[:create]
  before_action :set_comment, only:[:destroy,:update]
  def create
    @comment = @post.comments.create(comment_params.merge({user_id: current_user.id}))
    redirect_to '/home'
  end

  def destroy
    @comment.destroy
    redirect_to '/home'
  end

  def update
    @comment.update(comment_params)
    redirect_to '/home'
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
