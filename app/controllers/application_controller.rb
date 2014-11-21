class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  skip_before_filter :verify_authenticity_token, if: :json_request?

  protected

  def configure_permitted_parameters
    #TODO: Rename to login?
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit :email, :password
    end
  end

  def verify_jwt_token
    token = extract_token_from_headers(request.headers)
    head :unauthorized unless AuthToken.valid?(token)
  end

  def extract_token_from_headers(headers)
    auth_headers = headers['Authorization'] || ''
    auth_headers.split(' ').last
  end
end
