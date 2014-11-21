# This is an example of how to extend the devise sessions controller
# to support JSON based authentication and issuing a JWT.
class SessionsController < Devise::SessionsController
  require 'auth_token'

  skip_before_action :verify_authenticity_token
  before_filter :verify_jwt_token, except: [:create]
  skip_before_filter :verify_signed_out_user, only: :destroy

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?

    token = AuthToken.new({ user_id: resource.id }).token

    respond_with resource, location: after_sign_in_path_for(resource) do |format|
      format.json { render json: {user: resource.email, token: token} }
    end
  end
end
