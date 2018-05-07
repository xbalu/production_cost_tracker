class Company < ApplicationRecord
  has_many :application_users
  has_many :orders
  has_many :operations, through: :orders
  has_many :work_on_operations, through: :operations
  has_many :company_owners

  validates :name, presence: true, uniqueness: true
end
