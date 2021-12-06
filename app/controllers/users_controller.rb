class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit index destroy]
  before_action :set_user, only: %i[show make_admin ban unban destroy]
  before_action :require_admin_permissions!, only: %i[index make_admin ban unban]
  before_action :require_creator_permissions!, only: %i[destroy]

  # GET /users or /users.json
  def index
    @users = User.all.order('id DESC').page(params[:page] || 1)
  end
  
  # GET /users/1 or /users/1.json
  def show
    @reviews = @user.reviews.order('id DESC').page(params[:page] || 1)
  end

  # GET /users/new
  def new
    redirect_to new_user_registration_path || root_path
  end

  # GET /users/1/edit
  def edit
    redirect_to edit_user_registration_path || root_path
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
    end
  end

  def make_admin
    @user.roles.push Role.find_role(:admin)
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
    end
  end

  def ban
    @user.roles.push Role.find_role(:banned)
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
    end
  end

  def unban
    @user.roles.delete Role.find_role(:banned)
    respond_to do |format|
      format.html { redirect_to request&.referrer || root_path }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_creator_permissions!
    set_user
    redirect_to request&.referrer || root_path unless helpers.creator_permissions?(current_user, @user)
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
