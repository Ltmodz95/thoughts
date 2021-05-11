class AddIndexToReactions < ActiveRecord::Migration[6.1]
  def change
    add_index :reactions, [:user_id, :comment_id], unique: true
  end
end
