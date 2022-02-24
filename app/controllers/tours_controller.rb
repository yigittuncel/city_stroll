class ToursController < ApplicationController
  before_action :set_tours, only: [:show]

  def index
    @tours = Tour.all
  end

  def show; end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  private

  def set_tours
    @tour = Tour.find(params[:id])
  end

  def tour_params
    params.require(:tour).permit(:name, :city, :starting_point, :description, :duration, :price, :photo)
  end
end
