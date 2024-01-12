class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  include TimeFormatHelper

  protected

  def configure_permitted_parameters
    attributes = [:login, :email, :role_id, credential_ids: []]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
end
