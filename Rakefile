require 'rubygems'
require 'bundler/setup'

require 'rake'
require 'rake/testtask'
require 'rdoc/task'
require 'rubygems/package_task'

require 'appraisal'

desc 'Generate documentation for the prawnto plugin.'
RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Prawnto'

  rdoc.main = "README.rdoc"
  rdoc.rdoc_files.include("README.rdoc", "lib/**/*.rb")
end

require 'rspec/core/rake_task'

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
end
