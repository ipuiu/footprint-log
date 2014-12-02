require 'jeweler'

desc 'Run Jeweler task.'
Jeweler::Tasks.new do |gem|
  gem.name = 'footprint-log'
  gem.homepage = 'http://github.com/ipuiu/footprint-log'
  gem.license = 'MIT'
  gem.summary = %Q{Rack Application Log Decorator.}
  gem.description = %Q{Provides functionality to decorate Rack applications like Sinatra with loggers.}
  gem.email = 'ii.puiuionut@gmail.com'
  gem.authors = ['Puiu Ionut']
  gem.files = Dir.glob('lib/**/*.rb')
end
Jeweler::RubygemsDotOrgTasks.new