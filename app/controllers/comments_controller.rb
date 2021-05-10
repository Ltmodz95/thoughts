class CommentsController < ApplicationController
  before_action :set_post, only:[:create]
  def create
    @comment = @post.comments.create(comment_params.merge({user_id: current_user.id}))
    redirect_to '/home'
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
