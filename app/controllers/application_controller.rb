class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_locale

  def authenticate_admin!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.admin?
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

end
