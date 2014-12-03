require_relative '../log'


module Footprint

  #
  # Class that is actually the Middleware we use to decorate
  # the application with loggers, taking advantage of the @env.
  class Middleware

    # @app = the instance of the application that uses this middleware.
    # @logger = the instance of the logger used to decorate the Rack application.
    attr_accessor :app, :logger

    # Initialize the Middleware with the app that uses this
    # Middleware and an optional block.
    #
    # Sets as the default logger a Footprint::Log::Basic on STDOUT.
    #
    # Decorate the given app with a new method called logger,
    # that will return the instance of the logger from the env.
    #
    # If any block is given, a instance_eval is called.
    def initialize(app, &block)

      @app = app

      set Footprint::Log::Basic, STDOUT

      @app.class.send(:define_method, :logger,
                      Proc.new do
                        @env[:footprint_logger]
                      end)

      self.instance_eval &block if block
    end


    # The current instance of the logger is set on env[:footprint_logger]
    # and the app is called further with the enriched env.
    def call(env)
      env[:footprint_logger] = @logger
      @app.call env
    end

    # Initialize the current instance of the logger with
    # a new instance of the class given as parameter.
    #
    # The initialization of the class given is done using
    # the second parameter.
    def set clazz, *args
      @logger = clazz.send(:new, *args)
    end

  end

end