require 'rubygems'
require 'spork'

Spork.prefork do
  # Configure Rails Environment
  ENV["RAILS_ENV"] = "test"

  require File.expand_path("../dummy/config/environment.rb",  __FILE__)
  require 'rspec/rails'

  Rails.backtrace_cleaner.remove_silencers!

  # Load support files
  # Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

  RSpec.configure do |config|
    config.mock_with :mocha

    config.infer_base_class_for_anonymous_controllers = false
  end
  
  TEST_ASSETS = File.expand_path("assets", File.dirname(__FILE__)).to_s

end

Spork.each_run do
  # This code will be run each time you run your specs.

end

# Helper to provide asset path given the "base name" of the file.
# For example, if +file+ is "default_render", asset_path returns
# "/path/to/prawnto/spec/assets/default_render-#{prawn version}.pdf"
def asset_path(file)
  prawn_version = Gem.loaded_specs["prawn"].version.to_s.inspect
  TEST_ASSETS + "/#{file}-#{prawn_version.gsub('"','')}.pdf"
end
