class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: %i[ add_user_rating new create edit update destroy ]
  before_action :set_review, only: %i[ show destroy update edit ]
  before_action :require_creator_permissions!, only: %i[ destroy update edit ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.order("id DESC").page(params[:page] || 1)
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review || root_path }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review || root_path }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
      format.json { head :no_content }
    end
  end

  def add_user_rating
    Review.find(params[:id])&.ratings.push(Rating.new(user_rating: params[:rating], user: current_user))
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    def require_creator_permissions!
      set_review
      redirect_to request&.referrer || root_path if !helpers.creator_permissions?(current_user, @review.user)
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:name, :group, :content, :description, :author_rating, :user_id)
    end
end
