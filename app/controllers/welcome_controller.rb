class WelcomeController < ApplicationController
  def index
    render json: 'Welcome to Tuxedio!', status: HTTP_OK
  end
end
