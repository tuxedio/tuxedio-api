class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  skip_before_filter :verify_authenticity_token, if: :json_request?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :handle, :email, :password, :password_confirmation
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit :email, :password
    end
  end

  def verify_jwt_token
    token = extract_token_from_headers request.headers

    unless AuthToken.valid? token
      render json: { message: 'Authentication failed' }, status: :unauthorized
    end
  end

  def extract_token_from_headers(headers)
    auth_headers = headers['Authentication'] || ''
    auth_headers.split(' ').last
  end
end
