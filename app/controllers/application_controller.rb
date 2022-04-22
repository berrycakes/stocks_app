class ApplicationController < ActionController::Base
  # To edit strong parameters in devise forms
  before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_trader
    return unless current_user.role != 'trader'

    redirect_to root_path, alert: 'You are not authorized to visit that domain'
  end

  def authenticate_admin
    return unless current_user.role != 'admin'

    redirect_to root_path, alert: 'You are not authorized to visit that domain'
  end

  def authenticate_approval
    return if current_user.trader.approved

    redirect_to root_path, alert: 'Forbidden path. Please wait for your approval.'
  end

  # Add nested attributes/strong parameters for devise user
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:role,
                                             { trader_attributes: %i[first_name last_name mobile_number approved],
                                               admin_attributes: %i[first_name last_name mobile_number] }])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [trader_attributes: %i[id user_id first_name last_name mobile_number
                                                                   approved],
                                             admin_attributes: %i[id user_id first_name last_name mobile_number]])
  end
end
