require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
if ENV['coverage'] == 'true'
  require 'simplecov'
  SimpleCov.command_name 'test:spec'
end

require_relative '../lib/footprint/log'
require_relative '../lib/footprint/middleware'