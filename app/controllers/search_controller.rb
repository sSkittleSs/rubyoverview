class SearchController < ApplicationController
  RESULTS_PER_PAGE = 30
  def search
    if params[:term].nil?
      @reviews = []
    else
      @reviews = Review.search params[:term], fields: [:description, :name, :group, :content, :author_rating], highlight: true, page: params[:page] || 1, per_page: RESULTS_PER_PAGE
    end
  end
end
