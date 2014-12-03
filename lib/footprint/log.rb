module Footprint

  #
  # Module that wraps the Footprint Loggers content.
  #
  module Log; end

end

require_relative 'log/basic'
require_relative 'log/error_file'
require_relative 'log/out_file'
require_relative 'log/gelf'