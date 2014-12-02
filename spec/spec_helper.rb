require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.command_name 'test:spec'

require_relative '../lib/footprint/log'
require_relative '../lib/footprint/middleware'