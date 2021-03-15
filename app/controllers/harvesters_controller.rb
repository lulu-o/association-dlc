class HarvestersController < ApplicationController

	def create
	  @user_id = current_user.id
	  @harvest_id = params[:harvest_id]
    @harvester = Harvester.new(user_id: @user_id, harvest_id: @harvest_id)
    @harvester.save!
  end

end
