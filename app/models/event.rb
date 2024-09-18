class Event < ApplicationRecord

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations
end
