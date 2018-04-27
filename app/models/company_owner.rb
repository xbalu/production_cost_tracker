class CompanyOwner < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable

  belongs_to :company

  has_many :application_users, through: :company
  has_many :orders, through: :company
  has_many :operations, through: :company
  has_many :work_on_operations, through: :company
end
