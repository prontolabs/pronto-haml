# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pronto/haml_lint/version'

Gem::Specification.new do |s|
  s.name        = 'pronto-haml-lint'
  s.version     = Pronto::HamlLintVersion::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Mindaugas Mozūras'
  s.email       = 'mindaugas.mozuras@gmail.com'
  s.homepage    = 'http://github.org/mmozuras/pronto-haml-lint'
  s.summary     = 'Pronto runner for HAML-Lint, tool for writing clean and consistent HAML'

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files         = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_dependency 'haml-lint', '~> 0.6.0'
  s.add_runtime_dependency 'pronto', '~> 0.2', '>= 0.2.0'
  s.add_development_dependency 'rake', '~> 10.1', '>= 10.1.0'
  s.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.0'
end
