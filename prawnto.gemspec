Gem::Specification.new do |s|
  s.name = "prawnto_2"
  s.version = '0.3.1'
  s.author = ["Jobber", "Forrest Zeisler", "Nathan Youngman"]
  s.email = ["forrest@getjobber.com"]
  s.date = Time.now.utc.strftime("%Y-%m-%d")

  s.description = 'Simple PDF generation using the prawn library.'
  s.summary = "This gem allows you to use the PDF mime-type and the simple prawn syntax to generate impressive looking PDFs."

  s.required_rubygems_version = ">= 1.3.6"
  s.platform = Gem::Platform::RUBY
  s.add_dependency('rails', '>= 3.2')
  s.add_dependency('prawn', '>= 1.0.0')

  s.add_development_dependency "rspec-rails", "3.8.0"
  s.add_development_dependency "mocha", "0.14.0"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.extra_rdoc_files = ["README.rdoc"]
end
