class Rating < ApplicationRecord
  validates :user_id, :review_id, :user_rating, presence: true
  
  belongs_to :user
  belongs_to :review
end
