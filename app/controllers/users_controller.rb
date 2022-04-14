class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def delete; end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
