# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datetime_helper/version'

Gem::Specification.new do |spec|
  spec.name          = "datetime_helper"
  spec.version       = DatetimeHelper::VERSION
  spec.authors       = ["davesag"]
  spec.email         = ["davesag@gmail.com"]
  spec.summary       = "A collection of useful helpers for projects which have to deal with dates, times, and time zones."
  spec.description   = "The `Datetime Helper` was developed to provide a common approach to validating incoming datetime data, representing that data internally, serialising it back out into strings, and testing of date and time fields."
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
