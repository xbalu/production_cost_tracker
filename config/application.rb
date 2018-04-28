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
  end
end
