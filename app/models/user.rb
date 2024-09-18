

class User < ApplicationRecord
  before_save :update_user_data

  enum role: %i[admin normal]
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :name, presence: true

  has_secure_password

  def update_user_data
    self.role = :normal
  end

end
