class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # Deviseのカラム追加分
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :faculty_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :faculty_id])
  end
end
