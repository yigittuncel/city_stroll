class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :user

  validates :start_date, uniqueness: { scope: [ :tour_id, :user_id ] }, presence: true

end
