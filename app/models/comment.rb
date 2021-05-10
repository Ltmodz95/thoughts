# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :reactions

  def current_user_reaction(user_id)
    reactions.where(user_id: user_id).first
  end
end
