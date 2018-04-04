class ApplicationUser < ApplicationRecord
  after_initialize :generate_token, if: :new_record?
  before_save :encode_password, if: :password_changed?

  belongs_to :company

  has_many :work_on_operations

  validates :name, presence: true
  validates :login, presence: true, uniqueness: true, length: { minimum: 5, maximum: 32 }
  validates :password, presence: true, length: { minimum: 5, maximum: 32 }
  validates :token, presence: true, length: { is: 40 }
  validates :company, presence: true

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.zone.now, rand].join)
  end

  def encode_password
    self.password = Base64.encode64(password)
  end

  def decode_password
    self.password = Base64.decode64(password)
  end
end
