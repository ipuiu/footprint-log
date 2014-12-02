require_relative 'basic'

module Footprint

  module Log

    class ErrorFile < Basic

      def write(message)
        error message
      end

    end

  end

end