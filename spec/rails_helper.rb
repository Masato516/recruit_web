require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

# Register new Driver for Capybara
Capybara.register_driver :remote_chrome do |app|
  # Specification of the desired and/or actual capabilities of the browser that the server is being asked to create.
  chrome_capabilities = ::Selenium::WebDriver::Remote::Capabilities.chrome(
    "goog:chromeOptions" => {
      "args" => [
        "no-sandbox",
        "headless",
        "disable-gpu",
        "window-size=1680,1050"
      ]
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote, url: ENV['SELENIUM_REMOTE_URL'], desired_capabilities: chrome_capabilities)
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include FactoryBot::Syntax::Methods

  config.before(:each, type: :system) do
    driven_by :remote_chrome
    # Returns The IP address bound by default server
    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    # Returns the value of attribute server_port
    Capybara.server_port = 3000
    # The default host to use when giving a relative URL to visit, must be a valid URL
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

end
