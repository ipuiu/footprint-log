require 'logger'

module Footprint

  module Log

    # Class that extends the Ruby Logger.
    #
    # Does nothing extra for now but will be used to add generic
    # configuration in the future since other Footprint::Log
    # classes extend this.
    class Basic < Logger

      # Sets the default logdev as nil
      def initialize logdev = nil, shift_age = 0, shift_size = 1048576
        super
      end

    end

  end

end