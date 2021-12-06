class AddReferencesToRatings < ActiveRecord::Migration[6.1]
  def change
    add_reference :ratings, :user, null: false, foreign_key: true, index: true
    add_reference :ratings, :review, null: false, foreign_key: true, index: true
  end
end
