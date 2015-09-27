module Alphabetical
  extend ActiveSupport::Concern

  included do
    scope :alphabetical, -> { order('name ASC') }
  end
end
