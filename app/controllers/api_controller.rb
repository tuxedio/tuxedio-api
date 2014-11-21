class ApiController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :json
  skip_before_filter :verify_authenticity_token, if: :json_request?

  private

  def json_request?
    request.format.json?
  end
end
