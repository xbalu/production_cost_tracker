class Order < ApplicationRecord
  belongs_to :company

  has_many :operations, inverse_of: :order, dependent: :destroy
  has_many :work_on_operations, through: :operations

  validates :company, presence: true
  validates :key, presence: true, uniqueness: true
  validates :description, presence: true
  validates :amount, presence: true, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :operations, presence: true
  validate :validate_new_operations_uniqueness, if: -> { operations.any? }

  accepts_nested_attributes_for :operations, allow_destroy: true

  private

  def validate_new_operations_uniqueness
    operations.each do |operation|
      next if operation.persisted?
      next if operation.key.blank? || operation.errors[:key].any?

      duplicates = operations.find_all { |e| e.object_id != operation.object_id && e.key == operation.key }
      duplicates.each { |operation| operation.errors.add(:key, :duplicated) }
    end
  end
end
