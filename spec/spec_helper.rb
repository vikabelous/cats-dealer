require 'simplecov'
require 'codecov'

SimpleCov.start 'rails' do
  if ENV['CODECOV_TOKEN']
    formatter SimpleCov::Formatter::Codecov
  else
    formatter SimpleCov::Formatter::HTMLFormatter
  end

  add_group 'Services', 'app/services'

  add_filter 'vendor/'
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
