class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @users = set_user
  end

  private

  def set_user
    @users = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
