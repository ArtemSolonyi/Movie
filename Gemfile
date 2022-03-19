source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.3"

gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem "sprockets-rails"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'friendly_id', '~> 5.4.0'
gem 'devise'
gem 'sassc-rails'
gem 'jquery-rails'
gem 'webpacker'
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :production do
  gem 'pg'
end

group :development do
  gem "sqlite3", "~> 1.4"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
