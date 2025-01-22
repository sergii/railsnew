require "test_helper"
require "capybara/cuprite"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :cuprite, using: :headless_chrome, screen_size: [ 1400, 1400 ], options: {
    browser_options: {
      "no-sandbox" => nil,        # Required for running Chrome in CI
      "disable-gpu" => nil,       # Disable GPU usage for stability in headless mode
      "disable-dev-shm-usage" => nil # Prevent shared memory issues in CI
    },
    timeout: 30 # Increase timeout for slow CI environments
  }
end
