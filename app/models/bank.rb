class Bank < ApplicationRecord
  belongs_to :user
  has_many   :accounts

  # validations
  validates :name, presence: true, uniqueness: { scope: :user }
end
