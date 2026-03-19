class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # associations
  has_many :banks
  has_many :accounts, through: :banks
  has_many :transactions, through: :accounts

  # validations
  validates :name, presence: true
end
