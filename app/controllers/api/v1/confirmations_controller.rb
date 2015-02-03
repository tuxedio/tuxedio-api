module Api
  module V1
    class ConfirmationsController < Devise::ConfirmationsController
      def show
        self.resource = User.confirm_by_token params[:confirmation_token]
        yield resource if block_given?
        domain = Rails.application.secrets.domain_name
        navigate_to_after_confirmation_path resource.errors, domain
      end

      private

      def navigate_to_after_confirmation_path(errors, domain)
        if errors.empty?
          respond_with_navigational(resource) do
            redirect_to domain
          end
        else
          respond_with_navigational(errors, status: :unprocessable_entity) do
            redirect_to domain
          end
        end
      end
    end
  end
end
