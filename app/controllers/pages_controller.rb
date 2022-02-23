class PagesController < ApplicationController
  def home
    @tours = Tour.all.first(3)
  end
end
