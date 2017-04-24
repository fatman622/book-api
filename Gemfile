source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18.4'
gem 'puma', '~> 3.0'
gem 'apipie-rails'
gem 'rack-cors'
gem 'faker'
gem 'active_model_serializers', '~> 0.10.0'
gem 'jquery-rails'
gem 'elasticsearch-rails'
gem 'elasticsearch-model'
gem 'devise_token_auth'
gem 'omniauth'
gem 'paperclip', '~> 5.0.0'

group :production do
  gem 'rails_12factor'
  gem 'bonsai-elasticsearch-rails'
end


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'sqlite3'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
