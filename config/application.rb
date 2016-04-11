require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Slackdj
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.autoload_paths += ['operations']

    config.action_cable.url = "wss://#{ENV.fetch('APP_DOMAIN')}/cable"
    config.action_cable.allowed_request_origins = [ENV.fetch('ACTION_CABLE_ALLOWED_ORIGIN')]

    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.request_specs false
      generate.routing_specs false
      generate.test_framework :rspec
      generate.view_specs false
    end
  end
end
