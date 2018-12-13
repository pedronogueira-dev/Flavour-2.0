# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc "Look for style guide offenses in your code"
task :rubocop do
  sh "rubocop --format simple || true"
end

task :update_dependencies do
  sh "bundle install"
  sh "yarn install"
end

task :default do
  Rake::Task[:update_dependencies].invoke
  Rake::Task[:rubocop].invoke
end
