class WelcomeController < ApplicationController
  def index
    # TODO: Add dynamic hypermedia routing
    hypermedia = { experiences: v1_experiences_url }
    render json: hypermedia, status: :ok
  end
end
