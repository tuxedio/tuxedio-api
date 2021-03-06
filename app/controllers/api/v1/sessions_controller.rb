module Api
  module V1
    class SessionsController < Devise::SessionsController
      before_action :verify_authenticity_token, except: [:create]
      before_action :verify_jwt_token, except: [:create]
      skip_before_action :verify_signed_out_user, only: :destroy

      def create
        self.resource = warden.authenticate! auth_options
        sign_in resource_name, resource

        yield resource if block_given?

        token = TokenCreator.call(user_id: resource.id)

        respond_with resource, location: after_sign_in_path_for(resource) do |format|
          format.json { render json: { user: resource.email, token: token } }
        end
      end
    end
  end
end
