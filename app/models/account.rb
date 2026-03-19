class Account < ApplicationRecord
  self.inheritance_column = nil

  # enum
  enum :type, { saving: 0, current: 1, fd: 2 }

  # associations
  belongs_to :bank
  has_one :user, through: :bank
  has_many :transactions

  # validations
  validates :number, uniqueness: true
  validates :type, uniqueness: { scope: :bank }
end
