source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'active_model_serializers', '~> 0.10.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise_token_auth'
gem 'faker'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit', github: 'varvet/pundit'
gem 'rack-cors'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'pundit-matchers', '~> 1.7.0'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end
