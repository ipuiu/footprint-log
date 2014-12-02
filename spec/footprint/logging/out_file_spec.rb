require_relative '../../spec_helper'

describe Footprint::Log::OutFile do

  let(:app) {
    Footprint::Log::OutFile.new
  }

  let(:info_message) {
    'This is a info.'
  }

  it 'should log the message on info level when write method is called' do

    allow(app).to receive(:info) { info_message }

    app.write(info_message)

    expect(app).to have_received(:info).with(info_message)

  end

end