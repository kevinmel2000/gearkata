require 'spec_helper'
require_relative '../../app/service_objects/gear_list_url'

RSpec.describe GearListUrl, type: :module do
  let(:gear_list) { double(uuid: 'abc123' ) }
  let(:host) { 'test.example.com' }
  let(:port) { '8080' }

  context 'with port' do
    specify { expect(GearListUrl.for(gear_list, host, port)).to eq 'http://test.example.com:8080/abc123' }
  end

  context 'without port' do
    specify { expect(GearListUrl.for(gear_list, host)).to eq 'http://test.example.com/abc123' }
  end
end
