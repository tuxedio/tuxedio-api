class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  respond_to :json

  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  # TODO: make sure this is legit
  skip_before_filter :verify_authenticity_token

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation, :session
    end

    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit :email, :password, :session
    end
  end
end
