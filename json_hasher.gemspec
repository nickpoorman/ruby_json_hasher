# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_hasher/version'

Gem::Specification.new do |spec|
  spec.name          = "json_hasher"
  spec.version       = JSONHasher::VERSION
  spec.authors       = ["Nick Poorman"]
  spec.email         = ["nickpoorman@gmail.com"]

  spec.summary       = "Create a stable SHA-2 hash from a JSON object."
  spec.description   = "JSON objects do not require the keys to be in any kind of order which can make the hash unstable. This gem solves that problem."
  spec.homepage      = "https://github.com/nickpoorman/ruby_json_hasher"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
