# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  validates :user, uniqueness: { scope: :comment, message: 'You can have one reaction per comment' }
  enum react_type: %i[smile like heart]
end
