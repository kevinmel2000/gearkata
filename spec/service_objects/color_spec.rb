require 'spec_helper'
require_relative '../../app/service_objects/color'

RSpec.describe Color, type: :module do

  describe '#for' do
    specify { expect(Color.for('cats')).to eq '0832c1' }
    specify { expect(Color.for('camping')).to eq '38df36' }
  end
end
