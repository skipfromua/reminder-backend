source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.1"

# Database
gem "pg"
gem "redis", "~> 4.0"

# Web Server
gem "puma", "~> 5.0"

# Rails extentions & tools
gem "bootsnap", require: false
gem 'rack-cors'
gem 'telegram-bot'

# Auth
gem "devise"
gem "jwt"
gem "pundit", "~> 2.2"

# Api
gem "fast_jsonapi", "~> 1.5"

# Cron
gem 'whenever'

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'rubocop-rails'
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem 'shoulda-matchers'
  gem "webdrivers"
end

gem "tod", "~> 3.1"
