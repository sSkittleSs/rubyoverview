class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_to_ban_page, if: :banned?
  skip_before_action :redirect_to_ban_page, if: :devise_controller?

  AVAILABLE_LOCALES = { en: 'English', ru: 'Русский', be: 'Беларуская' }

  def default_url_options
    { locale: I18n.locale }
  end
  
  def require_admin_permissions!
    redirect_to request&.referrer || root_path unless (current_user&.role?(:admin) || false)
  end

  def creator_permissions?(user)
    helpers.creator_permissions? user
  end

  private

  def redirect_to_ban_page
    redirect_to ban_page_path
  end

  def banned?
    user_signed_in? && (current_user&.role?(:banned) || false)
  end

  def switch_locale(&block)
    locale = helpers.current_locale
    I18n.with_locale(locale, &block)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username email password password_confirmation remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username email password password_confirmation current_password])
  end
end
