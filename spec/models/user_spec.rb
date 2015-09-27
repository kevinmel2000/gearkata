require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    context 'invalid' do
      specify { expect(build(:user, email: nil, uuid: nil).valid?).to be false }
      specify { expect(build(:user, email: nil, uuid: 'cat').valid?).to be false }
    end

    context 'valid' do
      specify { expect(build(:user).valid?).to be true }
    end
  end

  # -------------------- Instance Methods --------------------

  describe '#create' do
    let(:user) { create(:user) }
    specify { expect(user.uuid).not_to be_nil }
  end

  describe '#to_s' do
    let(:user) { build(:user) }
    specify { expect(user.to_s).to eq user.name }
  end

  describe '#user?' do
    let(:user) { build(:user, admin_level: level) }

    context 'when true' do
      context 'equal' do
        let(:level) { 0 }
        specify { expect(user.user?).to be true }
      end

      context 'greater' do
        let(:level) { 32 }
        specify { expect(user.user?).to be true }
      end
    end

    context 'when false' do
      let(:level) { -1 }
      specify { expect(user.user?).to be false }
    end
  end

  describe '#editor?' do
    let(:user) { build(:user, admin_level: level) }

    context 'when true' do
      context 'equal' do
        let(:level) { 8 }
        specify { expect(user.editor?).to be true }
      end

      context 'greater' do
        let(:level) { 32 }
        specify { expect(user.editor?).to be true }
      end
    end

    context 'when false' do
      let(:level) { 0 }
      specify { expect(user.editor?).to be false }
    end
  end

  describe '#admin?' do
    let(:user) { build(:user, admin_level: level) }

    context 'when true' do
      context 'equal' do
        let(:level) { 32 }
        specify { expect(user.admin?).to be true }
      end

      context 'greater' do
        let(:level) { 99 }
        specify { expect(user.admin?).to be true }
      end
    end

    context 'when false' do
      let(:level) { 8 }
      specify { expect(user.admin?).to be false }
    end
  end

  describe '#label' do
    let(:user) { build(:user, name: name) }

    context 'with name' do
      let(:name) { 'Test User' }
      specify { expect(user.label).to eq user.name }
    end

    context 'with no name' do
      let(:name) { nil }
      specify { expect(user.label).to eq user.email }
    end
  end

  describe '#slug' do
    context 'default' do
      let(:user) { create(:user) }
      specify { expect(user.slug).not_to be_nil }
    end

    context 'simple' do
      let(:user) { create(:user, name: 'Test User') }
      specify { expect(user.slug).to eq user.name.parameterize }
    end

    context 'complex' do
      let!(:user_a) { create(:user, name: 'Test User') }
      let!(:user_b) { create(:user, name: 'Test User') }

      specify { expect(user_b.slug).to eq "#{user_b.name.parameterize}-#{user_b.uuid}" }
    end
  end
end
