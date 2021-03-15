class HarvestersController < ApplicationController

  def show
    @harvester = Harvester.find(params[:id])
  end

	def create
	  harvest = Harvest.find(params[:harvest_id])
    harvester = Harvester.new(user: current_user, harvest: harvest)
    harvester.save!
    redirect_to harvest_path(harvest)
  end

  def destroy
    harvester = Harvester.find(params[:id])
    harvester.destroy
  end

end
