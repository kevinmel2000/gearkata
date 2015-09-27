# When someone checks or unchecks a GearListItem, this is the
# thing that records that state
#
class GearListItemInfo < ActiveRecord::Base
  belongs_to :gear_list_item
  belongs_to :user

  validates_presence_of :checked
end
