class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # protect_from_forgery with: :exception
  # before_action :update_allowed_parameters, if: :devise_controller?

  # protected

  # def update_allowed_parameters
  #   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :Bio, :Photo, :email, :password) }
  #   devise_parameter_sanitizer.permit(:account_update) do |u|
  #     u.permit(:Name, :Bio, :Photo, :email, :password, :current_password)
  #   end
  # end
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation])
  end
end
