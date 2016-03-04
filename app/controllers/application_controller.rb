class ApplicationController < ActionController::Base
#  before_action :authenticate_user!
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation, :sex, :nationality, :residence) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :name, :email, :sex, :nationality, :residence, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :sex, :nationality, :residence, :current_password) }
    end
end
