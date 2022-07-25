class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    public_top_path
  end

  def after_sign_out_path_for(resource)
    if current_user.id =!  1
      new_user_session_path
    else
      new_user_registration_path
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:account_name])
  end

  def record_not_found
    redirect_to public_location_reports_path
  end
end
