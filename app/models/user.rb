class User < ApplicationRecord
  # associations
  has_many :banks, dependent: :destroy
  has_many :accounts, through: :banks
  has_many :transactions, through: :accounts
  has_many :transaction_titles, class_name: "Title", dependent: :destroy

  # vaidations
  validates :name, presence: true
end
