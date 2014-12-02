require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

desc 'Run all the tests.'
namespace :development do

  ENV['coverage'] = 'true'

  task :test => [:spec]

end

task :default => [:'development:test']