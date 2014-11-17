class SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_filter :verify_authenticity_token, if: :json_request?

  acts_as_token_authentication_handler_for User, fallback_to_devise: false

  skip_before_filter :authenticate_entity_from_token!
  skip_before_filter :authenticate_entity!
  skip_before_filter :verify_signed_out_user, only: :destroy
  before_filter :authenticate_entity_from_token!, only: [:destroy]
  before_filter :authenticate_entity!, only: [:destroy]


  # after_database_authentication :add_token_expiry

  def create
    warden.authenticate!(scope: resource_name)
    @user = current_user

    respond_to do |format|
      format.json { render json: {
          message: 'Logged in successfully.',
          uid: @user.email,
          authentication_token: @user.authentication_token
        }, status: 200
      }
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

  def add_token_expiry
    @user.authentication_token_expires_at 1.hour.from_now
  end

  def json_request?
    request.format.json?
  end
end
