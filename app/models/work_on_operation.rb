class WorkOnOperation < ApplicationRecord
  belongs_to :operation
  belongs_to :application_user

  has_one :order, through: :operation
  has_one :company, through: :operation

  validates :operation, presence: true
  validates :application_user, presence: true

  scope :active, -> { where(ended_at: nil) }
  scope :ended, -> { where.not(ended_at: nil) }
end
