class User < ActiveRecord::Base
  include Uuidable

  extend FriendlyId

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Admin levels determine what a user can do on the site. Levels are additive
  #
  #   :user can create their own lists and read public lists
  #   :editor can create items
  #   :admin can do anything
  #
  ADMIN_LEVEL = {
    :user   =>  0,
    :editor =>  8,
    :admin  => 32
  }

  has_many :categories
  has_many :expeditions
  has_many :gear_lists
  has_many :gear_list_item_infos
  has_many :items

  validates_presence_of :email
  validates_uniqueness_of :email

  friendly_id :slug_candidates, use: :slugged

  alias_attribute :to_s, :name

  # -------------------- Admin Levels --------------------

  def user?
    admin_level >= ADMIN_LEVEL.fetch(:user)
  end

  def editor?
    admin_level >= ADMIN_LEVEL.fetch(:editor)
  end

  def admin?
    admin_level >= ADMIN_LEVEL.fetch(:admin)
  end

  # -------------------- Instance Methods --------------------

  def label
    name.blank? ? email : name
  end

  def slug_candidates
    [
      :name,
      [:name, :uuid]
    ]
  end
end
