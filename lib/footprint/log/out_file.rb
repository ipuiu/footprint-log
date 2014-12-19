require_relative 'basic'

module Footprint

  module Log

    # Class that extends the Footprint::Log::Basic and
    # adds a write method which logs on info level.
    #
    # This Class can be used as a File instance to
    # write in log.
    class OutFile < Basic

      #
      # === Synopsis
      #
      #   write 'My dummy info log message'
      #
      # === Args
      #
      # +message+::
      #   The log message.  A String or Exception.
      #
      # === Return
      #
      # +true+ if successful, +false+ otherwise.
      #
      # === Description
      #
      # Logs the message on info level on logger.
      #
      def write(message)
        info message
      end

    end

  end

end