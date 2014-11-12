class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?

  respond_to :json

  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  private

  def configure_permitted_parameters
    #TODO: Rename to login?
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit :email, :password
    end
  end

  def set_user
    @user = current_user
  end
end
