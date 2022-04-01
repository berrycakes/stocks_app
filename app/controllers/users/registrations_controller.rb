# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # Skips the method :require_no_authentication for new and create
  # Used to allow looged in Users to create another user
  skip_before_action :require_no_authentication, only: %i[new create]

  # creates an alias 'devise_new' from Parent Class method 'new' so the 'new' method of Parent Class can be called in other methods in the children class
  alias devise_new new

  # GET /resource/sign_up
  # Used for nesting fields for trader under User form
  # def new
  # super
  # end

  def new_admin
    devise_new do |user|
      user.build_admin
    end
  end

  # POST /resource
  def create
    build_resource(sign_up_params)
    # Add user.build_trader
    # code does not work build_trader is only added as a block
    # for further studying
    # resource.build_trader
    build_association(resource.role)

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

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # Overrides sign_up method of RegistrationsController that logs user in after signing up
  def sign_up(resource_name, resource); end

  def build_association(role)
    case role
    when 'admin'
      resource.build_admin
    when 'trader'
      resource.build_trader
    else
      'Error'
    end
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
