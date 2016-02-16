# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails3/instantiation/version'

Gem::Specification.new do |spec|
  spec.name          = "rails3-instantiation"
  spec.version       = Rails3::Instantiation::VERSION
  spec.authors       = ["Caius Durling"]
  spec.email         = ["dev@caius.name"]
  spec.summary       = %q{Backports instantiation instrumentation from rails master to rails 3.2.18}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/caius/rails3-instantiation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 3.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
