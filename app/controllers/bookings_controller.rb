class BookingsController < ApplicationController

  def create
    @tour = Tour.find(params[:tour_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.tour = @tour
    @booking.user = @user
    if @booking.save
      redirect_to :root
    else
      render action: "show", controller: "tours", tour: @tour
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :tour, :user)
  end
end
