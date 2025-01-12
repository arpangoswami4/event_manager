

class User < ApplicationRecord

  enum role: %i[admin normal]
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_digest_changed?
  validates :name, presence: true

  has_secure_password

  has_many :reservations, dependent: :destroy
  has_many :events, through: :reservations
  has_many :comments, dependent: :destroy


end
