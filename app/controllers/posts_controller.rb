# frozen_string_literal: true

class PostsController < ApplicationController
  layout 'authenticated'

  def index
    @posts = Post.includes(:user,:comments).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:notice] = 'bravo'
      redirect_to user_root_url
    else
      flash[:alert] = 'kos omak'
    end
  end

  def my_posts
    @posts = current_user.posts
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
