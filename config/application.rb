require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

require File.expand_path('../../lib/monkey_patches', __FILE__)

module ProductionCostTracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.autoload_paths << Rails.root.join('app/filters')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Europe/Warsaw'

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en

    config.action_view.raise_on_missing_translations = true

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default charset: 'utf-8'

    config.action_mailer.smtp_settings = {
      address: ENV['SMTP_ADDRESS'],
      port: ENV['SMTP_PORT'],
      domain: ENV['SMTP_DOMAIN'],
      authentication: ENV['SMTP_AUTHENTICATION'],
      enable_starttls_auto: ENV['SMTP_ENABLE_STARTTLS_AUTO'],
      user_name: ENV['SMTP_USER_NAME'],
      password: ENV['SMTP_PASSWORD']
    }
  end
end
