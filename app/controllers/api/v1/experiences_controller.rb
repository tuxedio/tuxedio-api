module Api
  module V1
    class ExperiencesController < ApiController
      before_filter :verify_jwt_token, except: [:show, :index]
      before_action :set_experience, only: [:show, :edit, :update, :destroy]
      respond_to :json

      def index
        @experiences = Experience.all
        paginate json: @experiences
      end

      def show
        render json: @experience
      end

      def destroy
        @experience.destroy

        # We respond with no_content regardless as to not give any extra
        # information about the existence of the resource.
        head :no_content
      end

      def create
        @experience = current_person.hosted_experiences.new experience_params

        if @experience.save
          render json: @experience, status: :created
        else
          render json: errors_for(@experience), status: :unprocessable_entity
        end
      end

      private

      def set_experience
        @experience = Experience.find params[:id]
      end

      def experience_params
        params.require(:experience).permit(
          :name,
          :location,
          :description,
          :experience_times
        )
      end
    end
  end
end
