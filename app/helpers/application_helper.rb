module ApplicationHelper
  def current_locale
    params[:locale] || I18n.default_locale
  end
end
