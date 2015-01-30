class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :handle, :email, :password, :password_confirmation
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit :email, :password
    end
  end

  def current_person
    TokenAuthenticator.user_from_token(user_token).role
  end
end
