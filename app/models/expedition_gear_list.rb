class ExpeditionGearList < ActiveRecord::Base
   belongs_to :expedition, inverse_of: :expedition_gear_lists
   belongs_to :gear_list,  inverse_of: :expedition_gear_lists
end
