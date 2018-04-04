class Operation < ApplicationRecord
  belongs_to :order

  has_many :work_on_operations
  has_one :company, through: :order

  validates :key, presence: true
  validates :estimated_time, presence: true
  validates :company, presence: true
  validates :order, presence: true
end
