class Order < ApplicationRecord
  belongs_to :company

  has_many :operations
  has_many :work_on_operations, through: :operations

  validates :key, presence: true
  validates :company, presence: true
end
