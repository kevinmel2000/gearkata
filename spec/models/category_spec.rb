require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'validations' do
    context 'invalid' do
      specify { expect(build(:category, name: nil, uuid: nil).valid?).to be_falsey }
      specify { expect(build(:category, name: nil, uuid: 'cat').valid?).to be_falsey }
    end

    context 'valid' do
      specify { expect(build(:category).valid?).to be_truthy }
    end
  end

  # -------------------- Instance Methods --------------------

  describe '#create' do
    let(:category) { create(:category) }
    specify { expect(category.uuid).not_to be_nil }
  end

  describe '#to_s' do
    let(:category) { build(:category) }
    specify { expect(category.to_s).to eq category.name }
  end

  describe '#slug' do
    let(:category) { create(:category) }
    specify { expect(category.slug).to eq category.name.parameterize }
  end
end
