class AddIndexToRatings < ActiveRecord::Migration[6.1]
  def change
    add_index :ratings, [:user_id, :review_id], unique: true
  end
end
