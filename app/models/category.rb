class Category < ActiveRecord::Base
  include Alphabetical
  include Uuidable

  extend FriendlyId

  belongs_to :user, inverse_of: :categories

  has_many :gear_lists

  validates_presence_of :name

  friendly_id :slug_candidates, use: :slugged

  alias_attribute :to_s, :name

  # -------------------- Instance Methods --------------------

  def slug_candidates
    [
      :name,
      [:name, :uuid]
    ]
  end
end
