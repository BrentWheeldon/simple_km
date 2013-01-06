# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_km/version'

Gem::Specification.new do |gem|
  gem.name          = "simple_km"
  gem.version       = SimpleKM::VERSION
  gem.authors       = ["Brent Wheeldon"]
  gem.email         = ["brent.wheeldon@gmail.com"]
  gem.description   = %q{Threadsafe KissMetrics client}
  gem.summary       = %q{Very basic client for the KissMetrics API}
  gem.homepage      = "https://github.com/BrentWheeldon/simple_km"
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'httparty'
  gem.add_dependency 'addressable'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'pry'
end
