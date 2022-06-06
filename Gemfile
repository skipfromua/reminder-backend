source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.1"

# Database
gem "pg"
gem "redis", "~> 4.0"

# Web Server
gem "puma", "~> 5.0"

# Rails extentions & tools
gem "bootsnap", require: false

# Auth
gem "devise"
gem "jwt"

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :development do
  gem 'rubocop-rails'
  gem "web-console"
end

group :test do
  gem "capybara"
  gem 'faker'
  gem "selenium-webdriver"
  gem 'shoulda-matchers'
  gem "webdrivers"
end

gem "pundit", "~> 2.2"
