class ApplicationController < ActionController::Base

  before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:user_name, :email,:password ) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email,:password ) }
  end

  #def referer
  #  session[:return_to] ||= request.referer
  #end

end