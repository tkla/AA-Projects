require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ProgressTrackerLite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Jbuilder.key_format camelize: :lower
    zones = {
      'EST' => 'Eastern Time (US & Canada)',
      'PST' => 'America/Los_Angeles'
    }
    zone = zones[Time.now.getlocal.zone]
    config.time_zone = 'UTC'
    config.active_record.default_timezone = :local
  end
end
