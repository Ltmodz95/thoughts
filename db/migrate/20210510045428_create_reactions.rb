# frozen_string_literal: true

class CreateReactions < ActiveRecord::Migration[6.1]
  def change
    create_table :reactions do |t|
      t.integer :react_type
      t.belongs_to :comment
      t.belongs_to :user
      t.timestamps
    end
  end
end
