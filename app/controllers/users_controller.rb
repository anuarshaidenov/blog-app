class UsersController < ApplicationController
  def index
    @users = User.all.includes(:posts)
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end
end
