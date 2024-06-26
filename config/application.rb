require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RideShare
  class Application < Rails::Application
   config.generators do |g|
    g.stylesheets false
    g.jacascripts false
    g.helper false
    g.test_framework false
    end
  end
end
