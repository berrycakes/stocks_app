class ApplicationController < ActionController::Base
  # To edit strong parameters in devise forms
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # Method used to add permitted attributes for devise
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name mobile_number approved admin])
  #   devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name mobile_number approved admin])
  # end
end
