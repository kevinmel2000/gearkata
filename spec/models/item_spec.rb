require 'rails_helper'

RSpec.describe Item, type: :model do

  describe 'validations' do
    context 'invalid' do
      specify { expect(build(:item, name: nil, uuid: nil).valid?).to be_falsey }
      specify { expect(build(:item, name: nil, uuid: 'cat').valid?).to be_falsey }
    end

    context 'valid' do
      specify { expect(build(:item).valid?).to be_truthy }
    end
  end

  # -------------------- Scopes --------------------

  describe '#blessed' do
    let!(:blessed) { create(:item, blessed: true) }
    let!(:unblessed) { create(:item, blessed: false) }

    specify { expect(Item.blessed).to include blessed }
    specify { expect(Item.blessed).not_to include unblessed }
  end

  # -------------------- Class Methods --------------------

  describe '.all_tags' do

  end

  # -------------------- Instance Methods --------------------

  describe '#create' do
    let(:item) { create(:item) }

    specify { expect(item.api_token).not_to be_nil }
    specify { expect(item.uuid).not_to be_nil }
  end

  describe '#to_s' do
    let(:item) { build(:item) }
    specify { expect(item.to_s).to eq item.name }
  end

  describe '#default_quantity' do
    let(:item) { build(:item, default_amount: 3) }
    specify { expect(item.default_quantity).to eq item.default_amount }
  end
end
