require 'spec_helper'
require_relative '../../app/constraints/gear_list_constraint'

RSpec.describe GearListConstraint, type: :class do

  describe '#matches?' do
    let(:request) { double(path_parameters: { list_uuid: uuid }) }

    context 'when true' do
      let(:uuid) { 'abcd-1234-abcd-1234' }
      specify { expect(GearListConstraint.new.matches?(request)).to be true }
    end

    context 'when false' do
      let(:uuid) { 'abcd-1234-abcd' }
      specify { expect(GearListConstraint.new.matches?(request)).to be false }
    end
  end

end
