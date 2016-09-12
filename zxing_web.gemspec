# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zxing_web/version'

Gem::Specification.new do |spec|
  spec.name          = "zxing_web"
  spec.version       = ZxingWeb::VERSION
  spec.authors       = ["akm"]
  spec.email         = ["akm2000@gmail.com"]

  spec.platform      = 'java'
  spec.summary       = %q{Provides APIs to decode barcode image}
  spec.description   = %q{Provides APIs to decode barcode image}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "zxing"
  spec.add_runtime_dependency "sinatra"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
