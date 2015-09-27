module Tokenable
  extend ActiveSupport::Concern

  included do
    validates :api_token, presence: true, uniqueness: true

    before_validation(on: :create) { self.api_token = SecureRandom.hex(8) if self.api_token.nil? }
  end
end
