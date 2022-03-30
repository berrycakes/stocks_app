class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  # To edit strong parameters in devise forms
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @users = User.all
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  # Method used to add permitted attributes for devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name mobile_number approved admin])
  end
end
