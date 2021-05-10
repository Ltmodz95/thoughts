# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  validates_uniqueness_of :user_id, :comment_id

  enum react_type: %i[smile like heart]
end
