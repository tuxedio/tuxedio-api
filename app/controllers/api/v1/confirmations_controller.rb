module Api
  module V1
    class ConfirmationsController < Devise::ConfirmationsController
      def show
        self.resource = User.confirm_by_token(
          confirmations_params[:confirmation_token]
        )

        yield resource if block_given?

        navigate_to_after_confirmation_path(
          resource,
          confirmations_params[:callback]
        )
      end

      private

      def navigate_to_after_confirmation_path(res, domain)
        if res.errors.empty?
          respond_with_navigational res do
            redirect_to domain
          end
        else
          respond_with_navigational res.errors, status: :unprocessable_entity do
            redirect_to domain
          end
        end
      end

      def confirmations_params
        params.permit :callback, :confirmation_token
      end
    end
  end
end
