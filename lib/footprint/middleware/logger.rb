require_relative '../log'


module Footprint

  #
  # Class that is actually the Middleware we use to decorate
  # the application with loggers, taking advantage of the @env.
  class Middleware

    # The instance of the Rack +app+ that uses this middleware.
    attr_accessor :app

    # The instance of the +logger+ used to decorate the Rack application.
    attr_accessor :logger



    #
    # === Synopsis
    #
    # Basic Middleware usage:
    #
    #   use Footprint::Middleware
    #
    # Advanced Middleware usage:
    #
    #   use Footprint::Middleware do
    #     set Logger, STDOUT
    #   end
    #
    # Clazz init:
    #
    #   Footprint::Middleware.new app # => #<Footprint::Middleware>
    #
    # === Args
    #
    # +app+::
    #   Rack application instance.
    # +block+::
    #   Optional block, used to instance_eval (defaults to nil)
    #
    # === Description
    #
    # Initialize the Middleware with the +app+ that uses this
    # Middleware and an optional +block+.
    #
    # Sets as the default logger a Footprint::Log::Basic on STDOUT.
    #
    # Decorate the given +app+ with a new method called logger,
    # that will return the instance of the logger from the env.
    #
    # If any +block+ is given, a instance_eval is called.
    #
    def initialize(app, &block)

      @app = app

      set Footprint::Log::Basic, STDOUT

      @app.class.send(:define_method, :logger,
                      Proc.new do
                        @env[:footprint_logger]
                      end)

      self.instance_eval &block if block
    end

    #
    # === Synopsis
    #
    #   Footprint:Middleware.call env # => env
    #
    # === Args
    #
    # +env+::
    #   Rack request environment.
    #
    # === Return
    #
    # +env+ returned always.
    #
    # === Description
    #
    # The current instance of the logger is set on env[:footprint_logger]
    # and the app is called further with the enriched env.
    #
    def call(env)
      env[:footprint_logger] = @logger
      @app.call env
    end

    #
    # === Synopsis
    #
    # Basic usage:
    #
    #   Footprint.Middleware.set Logger, STDOUT # => logger
    #
    # === Args
    #
    # +clazz+::
    #   Any Logger class that has the default Logger methods.
    #
    # +args+::
    #   Optional array of arguments passed to the Logger class for initialize (defaults to nil)
    #
    # === Return
    #
    # +logger+ returned always.
    #
    # === Description
    #
    # Initialize the current instance of the logger with
    # a new instance of the class given as parameter.
    #
    # The initialization of the class given is done using
    # the second parameter.
    #
    def set clazz, *args
      @logger = clazz.send(:new, *args)
    end

  end

end