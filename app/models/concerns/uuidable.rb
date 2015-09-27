module Uuidable
  extend ActiveSupport::Concern

  included do
    validates :uuid, presence: true, uniqueness: true

    before_validation(on: :create) { self.uuid = SecureRandom.uuid if self.uuid.nil? }
  end
end
