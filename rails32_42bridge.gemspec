$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails32_42bridge/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails32_42bridge"
  s.version     = Rails3242bridge::VERSION
  s.authors     = ["Karl Baum"]
  s.email       = ["karl.baum@gmail.com"]
  s.homepage    = "TODO: Put your gem's website or public repo URL here."
  s.summary       = %q{Conveniences for allowing the same code base to possibly run rails 3.2 and rails 4.2}
  s.description   = %q{It's not fun to upgrade from rails 3.2 to 4.2 in one big bang on a large code base.}

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.6"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
