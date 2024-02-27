# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "grape/attack/version"

Gem::Specification.new do |spec|
  spec.name          = "grape-attack"
  spec.version       = Grape::Attack::VERSION
  spec.authors       = ["Nick Schneble"]
  spec.email         = ["nschneble@users.noreply.github.com "]

  spec.summary       = %q{Grape middleware for global throttling.}
  spec.description   = %q{A forked version of the Grape::Attack middleware focused exclusively on global throttling.}
  spec.homepage      = "https://github.com/nschneble/grape-attack"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "grape", ">= 0.16", "< 2.0"
  spec.add_dependency "redis-namespace", "~> 1.5"
  spec.add_dependency "activemodel", ">= 4.0"
  spec.add_dependency "activesupport", ">= 4.0", "< 8.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
