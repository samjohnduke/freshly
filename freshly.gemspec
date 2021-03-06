# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freshly/version'

Gem::Specification.new do |spec|
  spec.name          = "freshly"
  spec.version       = Freshly::VERSION
  spec.authors       = ["Sam John Duke"]
  spec.email         = ["mail@samjohnduke.com"]

  spec.summary       = %q{Ruby api wrapper for the freshdesk api v2}
  spec.description   = %q{Ruby api wrapper for the freshdesk api v2}
  spec.homepage      = "https://github.com/samjohnduke/freshly"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "json"

end
