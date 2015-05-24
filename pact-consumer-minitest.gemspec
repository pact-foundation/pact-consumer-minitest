# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pact/consumer/minitest/version'

Gem::Specification.new do |spec|
  spec.name          = "pact-consumer-minitest"
  spec.version       = Pact::Consumer::Minitest::VERSION
  spec.authors       = ["Beth Skurrie"]
  spec.email         = ["beth@bethesque.com"]
  spec.summary       = %q{Provides Minitest support for the Pact Consumer gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pact", "~> 1.3"
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", ">= 5.0.0"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "pry"
end
