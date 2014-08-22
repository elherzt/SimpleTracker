class ApplicationController < ActionController::Base
 before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :username
    #devise_parameter_sanitizer.for(:sign_in) << :username
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  end

  protected
  def after_sign_in_path_for(resource)
    user_projects_path(resource)
  end

end
