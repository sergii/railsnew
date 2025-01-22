ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "capybara/cuprite"
require "capybara-screenshot/minitest"
require "minitest/reporters"
require "pretty_diffs"

# Configure Minitest reporters
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Configure Capybara for system tests
Capybara.default_driver = :cuprite
Capybara.javascript_driver = :cuprite
Capybara.default_max_wait_time = 5 # Adjust as needed for your app's responsiveness

# Configure Capybara Screenshot
Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.prune_strategy = :keep_last_run

# Save screenshots in the `tmp/screenshots` folder
Capybara.save_path = Rails.root.join("tmp", "screenshots")

module ActiveSupport
  class TestCase
    include PrettyDiffs

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
