class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :first_name ,:last_name,:gender,:dob,:mob_no,:address])
  end


end
