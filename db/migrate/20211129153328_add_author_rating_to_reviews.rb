class AddAuthorRatingToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :author_rating, :float, null: false
  end
end
