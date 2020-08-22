source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'api-pagination'
gem 'apitome'
gem 'blueprinter'
gem 'devise-jwt'
gem 'oj'
gem 'pagy'
gem 'rack-cors'
gem 'r_creds'
gem 'redis'
gem 'rspec_api_documentation'
gem 'sidekiq'
gem 'xlog'
gem 'bootsnap', '>= 1.4.2', require: false

# AMQP
gem 'bunny', '~> 2.9', '>= 2.9.2'
gem 'sneakers', '2.7.0'

group :development, :test do
  gem 'dotenv'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'brakeman'
  gem 'bullet'
  gem 'rubocop'
  gem 'rubycritic'
  gem 'pry'
  gem 'pry-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fakeredis'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'rspec-sidekiq'
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
