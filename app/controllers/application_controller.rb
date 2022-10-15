class ApplicationController < ActionController::API
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  
  before_action :authenticate_with_token

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :Bio, :Photo, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:Name, :Bio, :Photo, :email, :password, :current_password)
    end
  end

  def authenticate_with_token
  if params[:api_token]
    user = User.find_by_api_token(params[:api_token])
    sign_in(user)
  end
  end
end
