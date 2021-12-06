class SearchController < ApplicationController
  RESULTS_PER_PAGE = 30
  def search
    @reviews = Review.search params[:term], fields: %i[description name group content author_rating], highlight: true, page: params[:page] || 1, per_page: RESULTS_PER_PAGE
  end
end
