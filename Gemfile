# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'puma', '~> 3.7'
gem 'rails', '~> 5.2.1'

group :pry do
  gem 'awesome_print', '1.8.0'
  gem 'byebug', '9.1.0'
  gem 'pry', '0.11.2'
  gem 'pry-byebug', '3.5.0'
  gem 'pry-doc', '0.11.1'
  gem 'pry-rails', '0.3.6'
end

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
