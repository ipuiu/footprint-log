require 'logger'

module Footprint

  module Log

    class Basic < Logger

      def initialize logdev = nil, shift_age = 0, shift_size = 1048576
        super
      end

    end

  end

end