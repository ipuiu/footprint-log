require 'gelf'

module Footprint

  module Log

    # Class that extends the GELF::Logger.
    #
    # Does nothing extra for now but will be used to add generic
    # configuration in the future since other Footprint::Log
    # classes will extend this.
    class Gelf < GELF::Logger

    end

  end

end