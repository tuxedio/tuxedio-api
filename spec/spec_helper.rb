RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def authenticate_user
    allow(TokenAuthenticator).to receive(:call).and_return true
    allow_any_instance_of(ApplicationController).to receive(:current_person)
      .and_return(create(:person))
  end
end
