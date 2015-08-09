# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_latest/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_latest'
  spec.version       = RailsLatest::VERSION
  spec.authors       = ['Abdelkader Boudih']
  spec.email         = ['terminale@gmail.com']

  spec.summary       = "A helper gem to migrate to latest version of rails"
  spec.homepage      = "https://github.com/seuros/rails_latest"
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.2.2'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|)/}) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'railties', '3.2.22'
  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
