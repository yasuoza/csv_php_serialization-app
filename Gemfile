source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
gem 'unicorn'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'sass'
gem 'coffee-script'
gem 'slim'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'sqlite3'

gem 'sprockets'
gem 'sprockets-helpers'

# Padrino Stable Gem
gem 'padrino', '~> 0.11.0'

# php serialization
gem 'php-serialization', github: 'yasuoza/ruby-php-serialization', branch: 'fix/multibyte_char_length'

group :development do
  gem 'yui-compressor'
  gem 'uglifier'
end

group :test do
  gem 'rspec'
  gem 'rack-test', :require => 'rack/test'
end

