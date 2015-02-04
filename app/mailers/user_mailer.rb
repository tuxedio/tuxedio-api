class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  def confirmation_instructions(record, token, opts = {})
    @confirmation_url = confirmation_url(
      record,
      confirmation_token: token,
      # Eventually configure based on the endpoint for app (mobile, etc)
      callback: Rails.application.secrets.domain_name
    )
    super
  end
end
