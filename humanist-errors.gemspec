# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'humanist/errors/version'

Gem::Specification.new do |spec|
  spec.name          = "humanist-errors"
  spec.version       = Humanist::Errors::VERSION
  spec.authors       = ["Chester Law", "Greg McGuirk"]
  spec.email         = ["chesterlaw@me.com", "bgregmc@icloud.com"]
  spec.summary       = %q{More readable and friendly errors, for humans.}
  spec.description   = %q{This gem appends on the Ruby error output to give a most likely explanation of the problem, as well as in more understandable terms.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
