class Tour < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :city, presence: true
  validates :starting_point, presence: true
  validates :description, presence: true, length: { in: 100..750 }
  validates :duration, presence: true
  validates :price, presence: true
end