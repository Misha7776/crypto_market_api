require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
require 'sprockets/railtie'

Bundler.require(*Rails.groups)

module CryptoMarketApi
  class Application < Rails::Application
    config.paths.add 'lib', eager_load: true
    config.paths.add 'data', eager_load: true
    config.paths.add 'data/concerns', eager_load: true
    config.paths.add 'business', eager_load: true
    config.paths.add 'infrastructure', eager_load: true
    
    config.middleware.use Xlog::Middleware
    config.generators.test_framework = :rspec
    config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins '*'
          resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options], expose: ['authorization']
        end
      end 
    config.active_job.queue_adapter = :sidekiq
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.event_store = RailsEventStore::Client.new

    AggregateRoot.configure do |config|
      config.default_event_store = Rails.application.config.event_store
    end
  end
end
