# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pwinty/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["tomgallard"]
  gem.email         = ["tom.gallard@cantab.net"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "pwinty"
  gem.require_paths = ["lib"]
  gem.version       = Pwinty::VERSION
  gem.add_development_dependency "rspec","~> 2.6"
  gem.add_development_dependency "webmock", "~> 1.8"
  gem.add_development_dependency "guard-rspec","~> 0.7"
  gem.add_dependency "faraday"
  gem.add_runtime_dependency "multi_json","~> 1.3"
  gem.add_dependency "faraday_middleware"
end
