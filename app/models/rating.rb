class Rating < ApplicationRecord
  validates :user_id, :review_id, :user_rating, presence: true
  validates :user_id, uniqueness: { scope: :review_id }
  
  belongs_to :user
  belongs_to :review
end
