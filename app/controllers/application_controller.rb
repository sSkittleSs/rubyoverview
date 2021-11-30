class ApplicationController < ActionController::Base
  around_action :switch_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def switch_locale(&block)
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &block)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :email, :password, :password_confirmation, :current_password])
  end
end
