class BanPageController < ApplicationController
  skip_before_action :redirect_to_ban_page

  def index
    redirect_to request&.referrer || root_path unless user_signed_in? && current_user.role?(:banned)
  end
end
