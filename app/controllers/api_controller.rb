class ApiController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  protected

  def user_token
    extract_token_from_headers request.headers
  end

  def extract_token_from_headers(headers)
    auth_headers = headers['Authentication'] || ''
    auth_headers.split(' ').last
  end

  def verify_jwt_token
    unless TokenAuthenticator.call user_token
      render json: { errors: 'Authentication failed' }, status: :unauthorized
    end
  end

  def errors_for(model)
    { errors: model.errors.full_messages }
  end
end
