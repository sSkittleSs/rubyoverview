class CategoriesController < ApplicationController
  before_action :require_admin_permissions!, only: %i[index destroy]
  before_action :set_category, only: %i[destroy]

  def index
    @categories = Category.order(:name).page(params[:page] || 1)
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
