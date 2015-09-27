class GearList < ActiveRecord::Base
  include Alphabetical
  include Tokenable
  include Uuidable

  extend FriendlyId

  acts_as_paranoid

  belongs_to :category, inverse_of: :gear_lists
  belongs_to :user,     inverse_of: :gear_lists

  has_many :expedition_gear_lists, dependent: :destroy
  has_many :gear_list_items,       dependent: :destroy

  has_many :expeditions, through: :expedition_gear_lists
  has_many :items, through: :gear_list_items

  validates_presence_of :name

  friendly_id :slug_candidates, use: :slugged

  alias_attribute :to_s, :name

  scope :blessed, -> { where(blessed: true) }

  # -------------------- Instance Methods --------------------

  # Returns an array of the ids of all the items in this list
  def item_ids
    items.map(&:id)
  end

  def slug_candidates
    [
      :name,
      [:name, :uuid]
    ]
  end
end
