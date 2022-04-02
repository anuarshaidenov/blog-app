class ApplicationController < ActionController::Base
  # Create a method called current_user in your ApplicationController.
  # A current_user method should return the first user from a database.
  def current_user
    User.first
  end
  helper_method :current_user
end
