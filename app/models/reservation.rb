class Reservation < ApplicationRecord

  validates :status, inclusion: { in: [true, false] }
  belongs_to :user
  belongs_to :event

end
