# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hanami/interactor/matcher/version"

Gem::Specification.new do |spec|
  spec.name          = "hanami-interactor-matcher"
  spec.version       = Hanami::Interactor::Matcher::VERSION
  spec.authors       = ["Anton Davydov"]
  spec.email         = ["antondavydov.o@gmail.com"]

  spec.summary       = %q{Dry matcher for hanami interactor results}
  spec.description   = %q{Dry matcher for hanami interactor results}
  spec.homepage      = "http://github.com/davydovanton/hanami-interactor-matcher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-matcher"
  spec.add_dependency "hanami-utils"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
end
