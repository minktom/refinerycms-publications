# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-publications'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Publications extension for Refinery CMS'
  s.date              = '2012-12-04'
  s.summary           = 'Publications extension for Refinery CMS'
  s.authors           = ['Tamás Drahos']
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.8'
  s.add_dependency             'chosen-rails'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.8'
end
