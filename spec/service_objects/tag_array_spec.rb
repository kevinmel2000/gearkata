require 'spec_helper'

RSpec.describe TagArray, type: :module do
  let(:tag_a) { double(name: 'tag a') }
  let(:tag_b) { double(name: 'tag b') }
  let(:tag_c) { double(name: 'tag c') }

  describe '#for' do
    let(:tags) { [tag_b, tag_c, tag_a] }

    specify { expect(TagArray.for(tags).first).to include tag_a.name.capitalize }
    specify { expect(TagArray.for(tags).first).to include tag_a.name }

    # Expect that the list is sorted
    specify { expect(TagArray.for(tags).map(&:first)).to eq ['Tag a', 'Tag b', 'Tag c'] }
  end
end
