class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pagy::Backend
  # フレンドリーフォワーディング
  before_action :store_user_location!, if: :storable_location?

  protected
  # Deviseのカラム追加分
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :faculty_id, :firstName, :lastName])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name,:name, :faculty_id, :firstName, :lastName])
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    # :user is the scope we are authenticating
    store_location_for(:user, request.fullpath)
  end
end
