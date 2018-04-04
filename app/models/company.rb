class Company < ApplicationRecord
  has_many :application_users
  has_many :orders
  has_many :operations, through: :orders
  has_many :work_on_operations, through: :operations

  validates :name, presence: true
end
