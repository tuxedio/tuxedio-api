class WelcomeController < ApplicationController
  def index
    render json: Experience.all, status: HTTP_OK
  end
end
