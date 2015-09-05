# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'pronto/haml/version'

Gem::Specification.new do |s|
  s.name = 'pronto-haml'
  s.version = Pronto::HamlLintVersion::VERSION
  s.platform = Gem::Platform::RUBY
  s.author = 'Mindaugas Mozūras'
  s.email = 'mindaugas.mozuras@gmail.com'
  s.homepage = 'http://github.org/mmozuras/pronto-haml'
  s.summary = <<-EOF
    Pronto runner for HAML-Lint, tool for writing clean and consistent HAML
  EOF

  s.required_rubygems_version = '>= 1.3.6'
  s.license = 'MIT'

  s.files = Dir.glob('{lib}/**/*') + %w(LICENSE README.md)
  s.test_files = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'haml_lint', '~> 0.15.0'
  s.add_runtime_dependency 'pronto', '~> 0.4.0'
  s.add_development_dependency 'rake', '~> 10.3'
  s.add_development_dependency 'rspec', '~> 3.3'
  s.add_development_dependency 'rspec-its', '~> 1.0'
end
