require 'logger'

module Footprint

  module Log

    # Class that extends the Ruby Logger.
    #
    # Does nothing extra except setting the default logdev as nil but will be used to add generic
    # configuration in the future since other Footprint::Log classes extend this.
    class Basic < Logger

      #
      # === Synopsis
      #
      #   Footprint::Log::Basic.new(name, shift_age = 7, shift_size = 1048576)
      #   Footprint::Log::Basic.new(name, shift_age = 'weekly')
      #
      # === Args
      #
      # +logdev+::
      #   The log device.  This is a filename (String) or IO object (typically
      #   +STDOUT+, +STDERR+, or an open file, defaults to nil).
      # +shift_age+::
      #   Number of old log files to keep, *or* frequency of rotation (+daily+,
      #   +weekly+ or +monthly+).
      # +shift_size+::
      #   Maximum logfile size (only applies when +shift_age+ is a number).
      #
      # === Description
      #
      # Create an instance with logdev as nil.
      #
      def initialize logdev = nil, shift_age = 0, shift_size = 1048576
        super
      end

    end

  end

end