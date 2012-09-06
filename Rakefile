#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

# Jenkins CI integration according to https://github.com/pludoni/railsTemplate
unless Rails.env.production?
  require 'ci/reporter/rake/rspec'
  require 'rspec/core/rake_task'
end

Clorg::Application.load_tasks
