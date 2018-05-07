class CompanyOwner < ApplicationRecord
  belongs_to :company

  has_many :application_users, through: :company
  has_many :orders, through: :company
  has_many :operations, through: :company
  has_many :work_on_operations, through: :company

  validates :email, presence: true
  validates :company, presence: true

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :invitable

  accepts_nested_attributes_for :company
end
