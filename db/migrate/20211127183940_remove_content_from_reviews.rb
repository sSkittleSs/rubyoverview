class RemoveContentFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :content, :text
  end
end
