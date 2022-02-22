class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  ## This is for the tours that a guide has created
  has_many :tours

  # This is for the bookings that a tourist has
  has_many :bookings

  ## This is for the tours that a tourist's gonna attend
  ## In order to use this association one has to write
  ## user.booked_tours
  has_many :booked_tours, through: :bookings, source: :tour

  # This is for the bookings that a guide has
  has_many :booked_bookings, through: :tours, source: :bookings

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
