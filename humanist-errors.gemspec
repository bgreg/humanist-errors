# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'humanist_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "humanist-errors"
  spec.version       = HumanistErrors::VERSION
  spec.authors       = ["Greg McGuirk"]
  spec.email         = ["bgregmc@icloud.com"]
  spec.summary       = %q{More readable and friendly errors, for humans.}
  spec.description   = %q{This gem appends a new message to the standard exception message, written from the perspective of a person instead of a complier.}
  spec.homepage      = "http://github.com/bgreg/humanist-errors"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features|error_mapper)/})

  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
