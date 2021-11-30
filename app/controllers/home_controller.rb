class HomeController < ApplicationController
  REVIEWS_PER_PAGE_COUNT = 5
  def index
    @last_reviews = Review.last(REVIEWS_PER_PAGE_COUNT).sort_by {|review| -review.id }
    @authors_top_reviews = Review.order('author_rating DESC').first(REVIEWS_PER_PAGE_COUNT)
    @users_top_reviews = Review.all.sort_by(&:average_users_rating).reverse!.first(REVIEWS_PER_PAGE_COUNT)
  end
end
