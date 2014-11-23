module Api
  module V1
    class ExperiencesController < ApplicationController
      before_filter :verify_jwt_token
      before_action :set_v1_experience, only: [:show, :edit, :update, :destroy]
      respond_to :json

      def index
        @v1_experiences = Experience.all
        respond_with @v1_experiences
      end

      def destroy
        @v1_experience.destroy
        head :no_content
      end

      private

      def set_v1_experience
        @v1_experience = Experience.find(params[:id])
      end

    end
  end
end
