class SessionsController < Devise::SessionsController
  respond_to :json

  acts_as_token_authentication_handler_for User, only: [:destroy],
    fallback_to_devise: false

  # skip_before_filter :verify_authenticity_token, if: :json_request?
  skip_before_filter :verify_signed_out_user, only: :destroy

  def create
    warden.authenticate!(scope: resource_name)
    @user = current_user

    payload = {
      message: 'Logged in successfully.',
      uid: @user.email,
      authentication_token: @user.authentication_token
    }

    respond_to do |format|
      format.json { render json: jwt_encode_payload(payload), status: 200 }
    end
  end

  def destroy
    if user_signed_in?
      @user = current_user
      @user.authentication_token = nil
      @user.save

      respond_to do |format|
        format.json {
          render json: {
            message: 'Logged out successfully.'
          }, status: 200
        }
      end
    else
      respond_to do |format|
        format.json {
          render json: {
            message: 'Failed to log out. User must be logged in.'
          }, status: 401
        }
      end
    end
  end

  private

  def json_request?
    request.format.json?
  end
end
