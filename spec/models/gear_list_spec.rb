require 'rails_helper'

RSpec.describe GearList, type: :model do

  describe 'validations' do
    context 'invalid' do
      specify { expect(build(:gear_list, name: nil, uuid: nil).valid?).to be_falsey }
      specify { expect(build(:gear_list, name: nil, uuid: 'cat').valid?).to be_falsey }
    end

    context 'valid' do
      specify { expect(build(:gear_list).valid?).to be_truthy }
    end
  end

  # -------------------- Scopes --------------------

  describe '#blessed' do
    let!(:blessed) { create(:gear_list, blessed: true) }
    let!(:unblessed) { create(:gear_list, blessed: false) }

    specify { expect(GearList.blessed).to include blessed }
    specify { expect(GearList.blessed).not_to include unblessed }
  end

  # -------------------- Instance Methods --------------------

  describe '#create' do
    let(:gear_list) { create(:gear_list) }

    specify { expect(gear_list.api_token).not_to be_nil }
    specify { expect(gear_list.uuid).not_to be_nil }
  end

  describe '#to_s' do
    let(:gear_list) { build(:gear_list) }
    specify { expect(gear_list.to_s).to eq gear_list.name }
  end

  describe '#item_ids' do
    let(:item_a) { create(:item) }
    let(:item_b) { create(:item) }
    let(:gear_list) { create(:gear_list) }

    before { [item_a, item_b].each { |itm| gear_list.items << itm } }

    specify { expect(gear_list.item_ids).to eq [item_a.id, item_b.id] }
  end

  describe '#slug' do
    let(:gear_list) { create(:gear_list) }
    specify { expect(gear_list.slug).to eq gear_list.name.parameterize }
  end
end
