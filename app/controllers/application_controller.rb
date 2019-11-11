class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :password, :current_password) }
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  private

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end
end
