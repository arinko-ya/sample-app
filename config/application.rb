require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.api_only = true

    # Health check
    config.middleware.use Rack::Health,
                          path: '/_health',
                          status: ->(healthy) { healthy ? 200 : 599 },
                          body: ->(healthy) { healthy ? 'healthy!' : 'unhealthy!' }
  end
end
