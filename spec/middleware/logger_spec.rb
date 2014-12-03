require_relative '../spec_helper'
require 'rack/mock'

describe Footprint::Middleware do

  class MockRackApp

    attr_accessor :env

    def initialize

    end

    def call env
      @env = env
      [200, {}, '']
    end
  end

  describe 'default usage' do

    let(:app) { MockRackApp.new }
    let(:stack) { Footprint::Middleware.new(app) }
    let(:request) { Rack::MockRequest.new(stack) }
    let(:response) { request.get('/') }

    it 'should decorate the Rack App with a logger of type Basic' do

      expect(response.status).to eql 200
      expect(app.respond_to? :logger).to be_truthy
      expect(app.logger).to be_an_instance_of Footprint::Log::Basic

    end

  end

  describe 'custom usage' do

    let(:app) { MockRackApp.new }
    let(:custom_logger_config) {
      Proc.new do
        set Footprint::Log::OutFile, STDOUT, 0
      end
    }
    let(:stack) { Footprint::Middleware.new(app, &custom_logger_config) }
    let(:request) { Rack::MockRequest.new(stack) }
    let(:response) { request.get('/') }

    it 'should decorate the Rack App with a logger of type OutFile' do

      expect(response.status).to eql 200
      expect(app.respond_to? :logger).to be_truthy
      expect(app.logger).to be_an_instance_of Footprint::Log::OutFile

    end

  end

end