require_relative '../../spec_helper'

describe Footprint::Log::ErrorFile do

  let(:app) {
    Footprint::Log::ErrorFile.new
  }

  let(:error_message) {
    'This is a error.'
  }

  it 'should log the message on error level when write method is called' do

    allow(app).to receive(:error) { error_message }

    app.write(error_message)

    expect(app).to have_received(:error).with(error_message)

  end

end