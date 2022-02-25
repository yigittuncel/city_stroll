class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @tours = Tour.all.first(4)
  end

  def dashboard
    @tourist_bookings = current_user.bookings
    @guide_reservations = current_user.booked_bookings
    @guide_tours = current_user.tours
  end
end
