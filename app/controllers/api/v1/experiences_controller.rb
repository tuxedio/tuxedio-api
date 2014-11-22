module Api
  module V1
    class ExperiencesController < ApplicationController
      before_filter :verify_jwt_token
      respond_to :json
      def index
        @v1_experiences = Experience.all

        respond_with @v1_experiences

      end
    end
  end
end
