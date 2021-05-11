# frozen_string_literal: true

class PostsController < ApplicationController
  layout 'authenticated'
  before_action :set_post, only: %i[destroy edit update show]
  def index
    @posts = Post.includes(:user, comments: %i[reactions user]).all
    @users = User.includes(:posts).all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      flash[:notice] = 'Post added'
      redirect_to user_root_url
    else
      flash[:alert] = 'error adding post'
    end
  end

  def my_posts
    @posts = Post.includes(:user, comments: %i[reactions user]).where(user: current_user)
    @users = User.includes(:posts).all
    render action: "index"
  end

  def user_posts
    @posts = Post.includes(:user, comments: %i[reactions user]).where(user: User.find(params[:user_id]))
    @users = User.includes(:posts).all
    render action: "index"
  end

  def edit; end

  def show; end

  def update
    @post.update(post_params)
    redirect_to @post
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post Removed'
    redirect_to '/home'
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
