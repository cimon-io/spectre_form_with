$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spectre_form_with/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spectre_form_with"
  s.version     = SpectreFormWith::VERSION
  s.authors     = ["Cody Lopez", "Alexey Osipenko"]
  s.email       = ["codyeatworld@fastmail.fm", "alexey@cimon.io"]

  s.summary       = %q{A really simple form builder targeting the newest versions of Rails and Spectre.css.}
  s.homepage      = "https://github.com/cimon-io/spectre_form_with"
  s.license       = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", '>= 3.0', '< 8.0'

  s.add_development_dependency "sqlite3"
end
