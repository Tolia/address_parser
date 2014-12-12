$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "address_parser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "address_parser"
  s.version     = AddressParser::VERSION
  s.authors     = ["tolia"]
  s.email       = ["toliademidov@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "address parser"
  s.description = "TODO: Description of AddressParser."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency 'rspec'
  s.add_runtime_dependency "geocoder"
end
