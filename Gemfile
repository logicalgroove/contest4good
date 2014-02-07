
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

source 'https://rubygems.org'
ruby '2.0.0'
gem 'rails', '4.0.2'
gem 'sass-rails', '~> 4.0.0'
gem 'bootstrap-sass', '~> 3.1.0.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'turbolinks'

#gem 'i18n_generators'
gem 'cancan'
gem 'devise'
gem 'devise-i18n'
gem 'devise_invitable'
gem 'figaro'
gem 'pg', '~> 0.15.1'
gem 'rolify'
gem 'simple_form', '>= 3.0.0.rc'
gem 'nokogiri'
gem 'json'
#gem 'font-awesome-rails'
#gem 'paperclip'
gem 'protected_attributes'
#gem 'slim-rails'
gem 'haml'

gem 'jquery-ui-rails'
gem 'jquery-rails'

gem "kaminari", "~> 0.14.1" # pagination


#gem 'paper_trail', '>= 3.0.0.beta1'

gem 'workflow', git: 'https://github.com/geekq/workflow'

gem 'jquery-turbolinks'


group :development do
  gem 'haml-rails'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms => [:mri_19, :mri_20, :rbx]
  gem 'guard', "~> 2.0.3"
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'quiet_assets'
  gem 'rb-fchange', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-inotify', :require => false
  gem 'pry'
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :production do
  gem 'rails_12factor'
  gem "passenger", '>= 4.0.18' # for heroku
  gem 'rollbar' # monitoring
  gem 'newrelic_rpm' # monitoring
end

group :test do
  gem 'poltergeist', '1.4.0'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem "simplecov", require: false
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'capybara-webkit', '1.1.1'
end

