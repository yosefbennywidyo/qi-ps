class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :username, :password, :password_confirmation])

    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :username, :password, :remember_me])

    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :username, :password, :password_confirmation])
  end
end
