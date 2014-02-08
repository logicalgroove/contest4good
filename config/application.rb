require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Contest4good
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:en, :ru]
    config.active_record.time_zone_aware_attributes = false

    config.active_record.schema_format = :ruby

    config.assets.paths << Rails.root.join('vendor','assets','fonts')
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

  end
end
