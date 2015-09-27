require 'rails_helper'

RSpec.describe GearListItem, type: :model do

  describe 'validations' do
    context 'invalid' do
      specify { expect(build(:gear_list_item, quantity: nil).valid?).to be_falsey }
    end

    context 'valid' do
      specify { expect(build(:gear_list_item).valid?).to be_truthy }
    end
  end

end
