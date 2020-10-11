source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'blueprinter'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise-jwt'
gem 'kaminari'
gem 'oj'
gem 'pagy'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'rails', '~> 6.0.0'
gem 'rails_event_store'
gem 'r_creds'
gem 'redis'
gem 'sidekiq'
gem 'xlog'

# AMQP
gem 'bunny', '~> 2.9', '>= 2.9.2'
gem 'sneakers', '2.7.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv'
  gem 'pry'
  gem 'pry-rails'
end

group :development do
  gem 'active_record_doctor'
  gem 'brakeman'
  gem 'bullet'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'rubycritic'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'fakeredis'
  gem 'rails_event_store-rspec'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'rspec-sidekiq'
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
