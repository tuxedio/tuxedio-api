class ApiController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  respond_to :json
  skip_before_action :verify_authenticity_token, if: :json_request?

  protect_from_forgery with: :null_session

  protected

  def verify_jwt_token
    unless RequestAuthenticator.call request
      render json: { errors: 'Authentication failed' }, status: :unauthorized
    end
  end

  def errors_for(model)
    { errors: model.errors.full_messages }
  end
end
