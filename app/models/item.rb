class Item < ActiveRecord::Base
  include Alphabetical
  include Tokenable
  include Uuidable

  acts_as_taggable_on :uses

  acts_as_paranoid

  belongs_to :user

  has_many :gear_list_items, dependent: :destroy
  has_many :gear_lists, through: :gear_list_items

  validates_presence_of :name
  validates_uniqueness_of :name

  alias_attribute :to_s, :name
  alias_attribute :default_quantity, :default_amount

  scope :blessed, -> { where(blessed: true) }

  # -------------------- Class Methods --------------------

  def self.all_tags
    self.all.map(&:use_list).flatten.uniq
  end
end
