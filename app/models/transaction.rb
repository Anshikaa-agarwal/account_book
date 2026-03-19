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

  # callbacks
  before_save :recalculate_account_balance
  before_destroy :reverse_account_balance_change

  private def signed_amount
    debit? ? -amount : amount
  end

  private def recalculate_account_balance
    previous_balance = account.balance

    if new_record?
      handle_new_transaction!(previous_balance)
    elsif persisted?
      handle_transaction_change!(previous_balance)
    end
  end

  private def handle_new_transaction!(previous_balance)
    account.update!(balance: previous_balance + signed_amount)
  end

  private def handle_transaction_change!(previous_balance)
    prev_type, new_type = changes[:type] || [ type, type ]
    prev_amt, new_amt = changes[:amount] || [ amount, amount ]

    prev_signed_amount = prev_type.to_s == "debit" ? -prev_amt : prev_amt
    new_signed_amount = new_type.to_s == "debit" ? -new_amt : new_amt

    account.update!(balance: previous_balance - prev_signed_amount + new_signed_amount)
  end

  private def reverse_account_balance_change
    account.update!(balance: account.balance - signed_amount)
  end
end
