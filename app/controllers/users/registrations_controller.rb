# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  before_action :set_user, only: %i[edit_trader update_trader]

  # Used to allow logged in Admin Users to create another user
  before_action :authenticate_user!, :redirect_unless_admin,  only: %i[new create]
  skip_before_action :require_no_authentication, only: %i[new create]

  # GET /resource/sign_up
  # def new
  # super
  # end

  # POST /resource
  def create
    build_resource(sign_up_params)

    # Prevents malicious injection of admin role on account creation
    if resource.role == 'admin' && (current_user.nil? ? !user_signed_in? : current_user.role != 'admin')
      redirect_to root_path, notice: 'Not authorized to create role'
      return
    end

    resource.save

    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  def edit_trader; end

  def update_trader
    user_params = params.require(:user).permit(:email, :role,
                                               trader_attributes: %i[id user_id first_name last_name mobile_number])
    if @user.update(user_params)
      redirect_to traders_path
    else
      render :edit
    end
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # Overrides sign_up method of RegistrationsController that logs user in after signing up
  # def sign_up(resource_name, resource); end

  def redirect_unless_admin
    return if current_user.try(:role) == 'admin' || !user_signed_in?

    redirect_to root_path, notice: 'Forbidden Path'
  end

  def set_user
    @user = User.find(params[:id])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
