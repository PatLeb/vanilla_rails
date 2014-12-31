class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  # not CanCanCan or Devise, but could be used to restrict overall access
  #http_basic_authenticate_with name: 'user', password: 'pwd'

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role
  end

  private

  def twitter_user
    @current_user ||= TwitterUser.find(session[:twitter_id]) if session[:twitter_id]
  end
  helper_method :twitter_user

end
