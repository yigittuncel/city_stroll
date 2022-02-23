class PagesController < ApplicationController
  def home
    @tours = Tour.all.first(3)
  end

  def dashboard
  end
end
