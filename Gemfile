source 'http://rubygems.org'

gem 'rails'
gem 'gravatar_image_tag'
gem 'will_paginate', '~> 3.0'
gem 'thin' #more solid webserver
gem 'foreman'
gem 'haml'
gem 'simple_form'
gem 'acts-as-taggable-on'
gem 'sorcery'
gem 'faker'

group :production do
gem 'pg'
gem 'therubyracer'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'annotate',
      :git => 'git://github.com/jeremyolliver/annotate_models.git',
      :branch => 'rake_compatibility'
  gem 'bullet'
  gem 'brakeman'
  gem "yard"
  gem "redcarpet"   # for yard to process .md files
  gem "rails_best_practices"
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem "ci_reporter", :require => false
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec'
  gem 'webrat'
  gem 'spork'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
