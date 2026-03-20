class Transaction < ApplicationRecord
  self.inheritance_column = nil

  # enum
  enum :type, { debit: 0, credit: 1 }

  # associations
  belongs_to :account
  has_one :user, through: :account

  # validations
  validates :title, presence: true
  validates :amount, comparison: { greater_than: 0 }
  validates :date, comparison: { less_than_or_equal_to: Date.today }
  validates :type, presence: true
end
