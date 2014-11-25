class WelcomeController < ApplicationController
  def index
    hypermedia = {
      experiences_url: v1_experiences_url
    }

    render json: hypermedia, status: :ok
  end
end
