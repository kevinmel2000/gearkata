require 'rails_helper'

RSpec.describe Expedition, type: :model do

  describe 'validations' do
    context 'invalid' do
      specify { expect(build(:expedition, name: nil, uuid: nil).valid?).to be false }
      specify { expect(build(:expedition, name: nil, uuid: 'cat').valid?).to be false }
    end

    context 'valid' do
      specify { expect(build(:expedition).valid?).to be true }
    end
  end

  # -------------------- Scopes --------------------

  describe '#blessed' do
    let!(:blessed) { create(:expedition, blessed: true) }
    let!(:unblessed) { create(:expedition, blessed: false) }

    specify { expect(Expedition.blessed).to include blessed }
    specify { expect(Expedition.blessed).not_to include unblessed }
  end

  # -------------------- Instance Methods --------------------

  describe '#create' do
    let(:expedition) { create(:expedition) }
    specify { expect(expedition.uuid).not_to be_nil }
  end

  describe '#to_s' do
    let(:expedition) { build(:expedition) }
    specify { expect(expedition.to_s).to eq expedition.name }
  end

  describe '#slug' do
    let(:expedition) { create(:expedition) }
    specify { expect(expedition.slug).to eq expedition.name.parameterize }
  end
end
