class AuthenticationController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :authenticate_request, only: %i[login register]

  def register
    @user = User.create! name: params[:name], email: params[:email], password: params[:password], bio: params[:bio],
                         photo: params[:photo], confirmed_at: Time.now

    render json: { user: @user }, status: :ok
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
