source 'https://rubygems.org'
ruby '2.2.3'

gem 'sinatra'
gem 'thin'
gem 'json'
gem 'sequel'
gem 'rake'
gem 'tux'
gem 'hirb'
gem 'jose'
gem 'http'

group :development do
  gem 'rerun'
end

group :test do
  gem 'minitest'
  gem 'rack-test'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
