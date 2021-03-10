class HarvestsController < ApplicationController
  def index
    @harvests = Harvest.joins(:partner).where('date >= ?', DateTime.now)

    # Retrieve harvests needing people - to be joined with upper query
    # Facon degueulasse
    # @emergency_harvest = Harvest.all.select do |harvest|
    #   harvest.harvesters_number > harvest.harvesters.count
    # end
    # Facon plus propre ne fonctionne pas - a creuser
    # Harvest.where('harvesters_number > harvesters.count')
  end

end
