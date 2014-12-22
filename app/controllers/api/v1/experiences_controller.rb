module Api
  module V1
    class ExperiencesController < ApplicationController
      before_filter :verify_jwt_token, except: [:show, :index]
      before_action :set_experience, only: [:show, :edit, :update, :destroy]
      respond_to :json

      def index
        @experiences = Experience.all.paginate page: experience_params[:page]
        render json:  @experiences, each_serializer: ExperienceSerializer,
          meta: PaginationMetadata.new(@experiences).serialize
      end

      def show
        render json: @experience
      end

      def destroy
        @experience.destroy
        head :no_content
      end

      private

      def set_experience
        @experience = Experience.find params[:id]
      end

      def experience_params
        params.permit :id, :page, :name, :experience
      end
    end
  end
end
