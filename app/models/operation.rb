class Operation < ApplicationRecord
  belongs_to :order

  has_many :work_on_operations, dependent: :destroy
  has_one :company, through: :order

  validates :order, presence: true
  validates :key, presence: true, uniqueness: true
  validates :description, presence: true
  validates :estimated_time, presence: true
end
