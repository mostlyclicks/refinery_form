# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = "refinerycms-registrations"
  s.version           = "1.0.0"
  s.description       = "Ruby on Rails Registrations forms-extension for Refinery CMS"
  s.date              = "2018-05-10"
  s.summary           = "Registrations forms-extension for Refinery CMS"
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = "Carlos Interone"

  # Runtime dependencies
  s.add_dependency    "refinerycms-core",     "~> 4.0.1"
  s.add_dependency    "refinerycms-settings", "~> 4.0.0"
  s.add_dependency    "filters_spam", "~> 0.3"
  s.add_dependency    "actionmailer"

  # Development dependencies (usually used for testing)
  s.add_development_dependency "refinerycms-testing", "~> 4.0.1"
end
