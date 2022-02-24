class PagesController < ApplicationController
  def home
    @tours = Tour.all.first(4)
  end

  def dashboard
  end
end
