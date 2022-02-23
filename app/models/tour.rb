class Tour < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  has_many :bookings
  has_many :users, through: :bookings

  validates :name, presence: true
  validates :city, presence: true
  validates :starting_point, presence: true
  validates :description, presence: true, length: { in: 100..750 }
  validates :duration, presence: true
  validates :price, presence: true
end
