# encoding: utf-8

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'sqlint'
require 'English'

Gem::Specification.new do |s|
  s.name = 'sqlint'
  s.version = SQLint::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.3'
  s.authors = ['Steve Purcell', 'Kieran Trezona-le Comte']
  s.description = <<-EOF
    Simple SQL linter.
  EOF

  s.email = 'steve@sanityinc.com'
  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ %r{^(?:
    spec/.*
    |Gemfile
    |Rakefile
    |\.rspec
    |\.ruby-version
    |\.rbenv-gemsets
    |\.gitignore
    |\.travis.yml
    )$}x
  end
  s.test_files = []
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.extra_rdoc_files = ['LICENSE.txt', 'README.md']
  s.homepage = 'https://github.com/purcell/sqlint'
  s.licenses = ['MIT']
  s.require_paths = ['lib']
  s.rubygems_version = '1.8.23'
  s.summary = 'Simple SQL linter.'

  s.add_runtime_dependency('pg_query', '~> 0.9.1')
  s.add_development_dependency('rake', '~> 10.1')
  s.add_development_dependency('rspec', '~> 3.2')
  s.add_development_dependency('bundler', '~> 1.3')
end
