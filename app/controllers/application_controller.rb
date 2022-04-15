class ApplicationController < ActionController::Base
  include JsonWebToken
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_request

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :photo, :bio, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :photo, :bio, :email, :password, :password_confirmation, :current_password)
    end
  end

  def authenticate_request
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = jwt_decode(header)
    @curr_user = User.find(decoded[:user_id])
  end
end
