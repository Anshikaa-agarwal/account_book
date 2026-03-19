class User < ApplicationRecord
  # associations
  has_many :banks
  has_many :accounts, through: :banks
  has_many :transactions, through: :accounts

  # validations
  validates :name, presence: true
end
