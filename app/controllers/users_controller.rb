class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ index destroy ]
  before_action :set_user, only: %i[ show destroy ]

  # GET /users or /users.json
  def index
    # TODO: if user is not admin -> redirect to back page or root page
    @users = User.all.order("id DESC").page(params[:page] || 1)
  end
  
  # GET /users/1 or /users/1.json
  def show
    @reviews = @user.reviews.order("id DESC").page(params[:page] || 1)
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
    if @user != current_user # TODO: add condition if user is admin
      redirect_to request&.referrer || root_path
    else
      @user.destroy
      respond_to do |format|
        format.html { redirect_to request&.referrer || root_path, notice: "User was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email)
    end
end
