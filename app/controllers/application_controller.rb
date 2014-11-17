class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :admin)}
      devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:name, :email, :password)}
      devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :password, :password_confirmation, :admin)}
    end
end
