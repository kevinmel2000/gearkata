class GearListItem < ActiveRecord::Base
  belongs_to :gear_list, inverse_of: :gear_list_items
  belongs_to :item,      inverse_of: :gear_list_items

  has_many :gear_list_item_infos

  validates_presence_of :quantity
end
