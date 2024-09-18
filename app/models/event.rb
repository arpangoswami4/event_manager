class Event < ApplicationRecord

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }

  has_many :reservations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :reservations

  has_one_attached :banner
end
