require 'rubygems'

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'minitest/autorun'
require 'rspec/rails'
require "mocha/setup"

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.mock_with :mocha

  config.infer_base_class_for_anonymous_controllers = false
  config.infer_spec_type_from_file_location!
end

TEST_ASSETS = File.expand_path("assets", File.dirname(__FILE__)).to_s

# Helper to provide asset path given the "base name" of the file.
# For example, if +file+ is "default_render", asset_path returns
# "/path/to/prawnto/spec/assets/default_render-#{prawn version}.pdf"
def asset_path(file)
  prawn_version = Gem.loaded_specs["prawn"].version.to_s.inspect
  ruby_version_folder = RUBY_VERSION.split(".")[0..1].join(".")
  TEST_ASSETS + "/#{ruby_version_folder}/#{file}-#{prawn_version.gsub('"','')}.pdf"
end
