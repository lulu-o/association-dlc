class HarvestsController < ApplicationController
  def index
    @harvests = Harvest.joins(:partner).where('date >= ?', DateTime.now)
  end

end
