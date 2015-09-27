require 'spec_helper'

RSpec.describe CategoryArray, type: :module do
  let(:category_a) { double(name: 'cat a', id: 1) }
  let(:category_b) { double(name: 'cat b', id: 2) }
  let(:category_c) { double(name: 'cat c', id: 3) }

  describe '#for' do
    let(:categories) { [category_b, category_c, category_a] }

    specify { expect(CategoryArray.for(categories).first).to include category_a.name }
    specify { expect(CategoryArray.for(categories).first).to include category_a.id }

    # Expect that the list is sorted
    specify { expect(CategoryArray.for(categories).map(&:first)).to eq ['cat a', 'cat b', 'cat c'] }
  end
end
