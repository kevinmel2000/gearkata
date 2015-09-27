class Expedition < ActiveRecord::Base
  include Alphabetical
  include Uuidable

  extend FriendlyId

  belongs_to :user, inverse_of: :expeditions

  has_many :expedition_gear_lists, dependent: :destroy

  has_many :gear_lists, through: :expedition_gear_lists

  validates_presence_of :name

  friendly_id :slug_candidates, use: :slugged

  alias_attribute :to_s, :name

  scope :blessed, -> { where(blessed: true) }

  # -------------------- Instance Methods --------------------

  def slug_candidates
    [
      :name,
      [:name, :uuid]
    ]
  end

end
