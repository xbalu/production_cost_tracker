class Order < ApplicationRecord
  belongs_to :company

  has_many :operations
  has_many :work_on_operations, through: :operations

  validates :company, presence: true
  validates :key, presence: true, uniqueness: true
  validates :description, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_or_equal_to: 0 }
end
