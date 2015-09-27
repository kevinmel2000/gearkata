require 'rails_helper'

RSpec.describe GearListSorter, type: :module do
  let(:gl_item_a) { create(:gear_list_item) }
  let(:gl_item_b) { create(:gear_list_item) }
  let(:gl_item_c) { create(:gear_list_item) }

  let(:gear_list) { create(:gear_list) }

  # Append the gear list items to the gear_list
  before { [gl_item_a, gl_item_b, gl_item_c].each { |itm| gear_list.gear_list_items << itm } }

  describe '#alphabetically' do
    # Expect that the list is sorted
    specify { expect(GearListSorter.alphabetically(gear_list)).to eq [gl_item_a, gl_item_b, gl_item_c] }
  end
end
