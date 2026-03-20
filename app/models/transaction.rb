class Transaction < ApplicationRecord
  self.inheritance_column = nil

  # enum
  enum :type, { debit: 0, credit: 1 }

  # associations
  belongs_to :account
  belongs_to :title
  has_one :user, through: :account

  # validations
  validates :title, presence: true
  validates :amount, comparison: { greater_than: 0 }
  validates :date_time, presence: true, comparison: { less_than_or_equal_to: -> { Time.current } }
  validates :type, presence: true

  def previous_transaction
    account.transactions
      .where("date_time < ? OR (date_time = ? AND id < ?)", date_time, date_time, id)
      .order(date_time: :desc, id: :desc)
      .first
  end
end
