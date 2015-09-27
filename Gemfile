source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails',                  '4.2.3'

gem 'acts-as-taggable-on',    '~> 3.5.0'
gem 'bcrypt',                 '~> 3.1.7'
gem 'cancancan',              '~> 1.12.0'
gem 'coffee-rails',           '~> 4.1.0'
gem 'devise',                 '~> 3.5.1'
gem 'friendly_id',            '~> 5.1.0'
gem 'haml-rails',             '~> 0.9.0'
gem 'jquery-rails',           '~> 4.0.4'
gem 'jquery-ui-rails',        '~> 5.0.5'
gem 'paranoia',               '~> 2.1.3'
gem 'pg',                     '~> 0.18.2'
gem 'puma',                   '~> 2.12.2'
gem 'rails_admin',            '~> 0.6.8'
gem 'sass-rails',             '~> 5.0'
gem 'uglifier',               '>= 1.3.0'

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'rspec-core'
  gem 'simplecov',                            require: false
  gem 'sqlite3'
end

group :development, :test do
  gem 'factory_girl_rails',   '~> 4.5.0'
  gem 'mutant-rspec',         '~> 0.8.2'
  gem 'rspec-rails',          '~> 3.3.3'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # For using rack-mini-profiler
  gem 'flamegraph'
  gem 'memory_profiler'
  gem 'rack-mini-profiler'
  gem 'stackprof'
end

