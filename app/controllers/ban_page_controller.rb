class BanPageController < ApplicationController
  def index
    redirect_to request&.referrer || root_path unless user_signed_in? && current_user.banned?
  end
end
