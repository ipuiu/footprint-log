require_relative '../log'


module Footprint

  class Middleware

    attr_accessor :app, :logger

    def initialize(app, &block)

      @app = app

      set Footprint::Log::Basic, STDOUT

      @app.class.send(:define_method, :logger,
                      Proc.new do
                        @env[:footprint_logger]
                      end)

      self.instance_eval &block if block
    end

    def call(env)
      env[:footprint_logger] = @logger
      @app.call env
    end

    def set clazz, options=nil
      @logger = clazz.send(:new, options)
    end

  end

end