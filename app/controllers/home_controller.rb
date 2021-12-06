class HomeController < ApplicationController
  LAST_REVIEWS_COUNT = 10
  AUTHORS_TOP_REVIEWS_COUNT = 10
  USERS_TOP_REVIEWS_COUNT = 10
  
  def index
    @last_reviews = Review.last(LAST_REVIEWS_COUNT).sort_by { |review| -review.id }
    @authors_top_reviews = Review.order('author_rating DESC').first(AUTHORS_TOP_REVIEWS_COUNT)
    @users_top_reviews = Review.all.sort_by(&:average_users_rating).reverse!.first(USERS_TOP_REVIEWS_COUNT)
  end
end
