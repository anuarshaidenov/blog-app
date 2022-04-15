class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def index
    @users = User.all.includes(:posts)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
