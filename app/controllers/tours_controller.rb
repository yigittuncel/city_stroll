class ToursController < ApplicationController
  before_action :set_tours, only: [:show]

  def show; end

  private

  def set_tours
    @tour = Tour.find(params[:id])
  end
end
