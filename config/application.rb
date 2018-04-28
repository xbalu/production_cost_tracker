require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProductionCostTracker
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Europe/Warsaw'

    config.i18n.available_locales = [:en]
    config.i18n.default_locale = :en

    config.action_view.raise_on_missing_translations = true

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  end
end
