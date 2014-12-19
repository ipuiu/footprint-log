require_relative 'basic'

module Footprint

  module Log

    # Class that extends the Footprint::Log::Basic and
    # adds a write method which logs on error level.
    #
    # This Class can be used as a File instance to
    # write in log.
    class ErrorFile < Basic

      #
      # === Synopsis
      #
      #   write 'My dummy error log message'
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
      # Logs the message on error level on logger.
      #
      def write(message)
        error message
      end

    end

  end

end