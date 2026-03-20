class Title < ApplicationRecord
  # associations
  belongs_to :user, inverse_of: :transaction_titles
  has_many   :transactions

  # validations
  validates :name, presence: true, uniqueness: { scope: :user_id }
end
