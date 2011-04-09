require 'powerup'
require 'rails'

module Powerup
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'powerup/railties/powerup.rake'
    end
  end
end