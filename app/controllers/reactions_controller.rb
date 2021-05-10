# frozen_string_literal: true

class ReactionsController < ApplicationController
  before_action :set_comment, only: [:create]
  before_action :set_reaction, only: [:destroy]
  def create
    @reaction = @comment.reactions.create(reaction_params.merge({ user_id: current_user.id }))
    if @reaction.save
      flash[:notice] = 'Thank you for your reaction'
    else
      flash[:alert] = 'something went wrong'
    end
    redirect_to '/home'
  end

  def destroy
    @reaction.destroy
    flash[:notice] = 'reaction removed :('
    redirect_to '/home'
  end

  private

  def reaction_params
    params.require(:reaction).permit(:react_type)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end

  def set_reaction
    @reaction = Reaction.find(params[:id])
  end
end
