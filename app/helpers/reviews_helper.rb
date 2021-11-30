module ReviewsHelper
  def description_formatted(review)
    review.description[...80]
  end

  def appreciated?(review)
    review.ratings&.find_by(user: current_user)
  end

  def current_rating(review)
    review.ratings&.find_by(user: current_user)&.user_rating
  end
end
