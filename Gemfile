# frozen_string_literal: true

source ENV['GEM_SOURCE'] || 'https://rubygems.org'

puppet_version = ENV['PUPPET_GEM_VERSION']

gem 'puppet', puppet_version, require: false if puppet_version
gem 'facter', ENV['FACTER_GEM_VERSION'], require: false if ENV['FACTER_GEM_VERSION']

group :test do
  gem 'voxpupuli-test', '~> 9.0', require: false
  gem 'puppet_metadata', '~> 4.0', require: false
end

group :development do
  gem 'pry', '~> 0.10', require: false
  gem 'puppet-strings', '~> 4.0', require: false
end

group :system_tests do
  gem 'voxpupuli-acceptance', '~> 3.0', require: false
end

group :release do
  gem 'voxpupuli-release', '~> 3.0', require: false
end

# Evaluate Gemfile.local and ~/.gemfile if they exist
extra_gemfiles = [
  "#{__FILE__}.local",
  File.join(Dir.home, '.gemfile'),
]

extra_gemfiles.each do |gemfile|
  if File.file?(gemfile) && File.readable?(gemfile)
    eval(File.read(gemfile), binding)
  end
end
# vim: syntax=ruby
