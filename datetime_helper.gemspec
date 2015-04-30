# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datetime_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "datetime_helper"
  spec.version       = DatetimeHelper::VERSION
  spec.authors       = ["davesag"]
  spec.email         = ["davesag@gmail.com"]
  spec.summary       = "A collection of useful helpers for projects which have to deal with dates, times, and timezones."
  spec.description   = "Enforcing Zulu Time across a range of projects requires a common approach to how you validate incoming strings, how you represent the data internally, how you serialise the data back out into strings, and how you test all that consistently and efficiently. The Datetime Helpers provide that common approach."
  spec.homepage      = "https://github.com/westfieldlabs/datetime_helper"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'rspec',       '~> 3'
  spec.add_runtime_dependency 'activemodel', '~> 4'
  spec.add_runtime_dependency 'active_model_serializers'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "pry"
  
end
