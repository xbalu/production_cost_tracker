source 'https://rubygems.org'

ruby '2.4.2', patchlevel: '198'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'active_type'
gem 'bootstrap-datepicker-rails'
gem 'bootstrap-tooltip-rails'
gem 'chartkick'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'date_validator'
gem 'devise'
gem 'devise_invitable'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'less-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6'
gem 'sass-rails', '~> 5.0'
gem 'select2-rails', '~> 3.5.9.3'
gem 'therubyracer'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'pry'
  gem 'pry-rails'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
