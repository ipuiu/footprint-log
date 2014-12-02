require_relative 'basic'

module Footprint

  module Log

    class OutFile < Basic

      def write(message)
        info message
      end

    end

  end

end