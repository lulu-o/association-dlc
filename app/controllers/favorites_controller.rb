class FavoritesController < ApplicationController
	def index
		@favorites = Favorite.where(user: current_user)
	end 

	def create
	  # @favorite = Favorite.new
	  @user = current_user
	  @partner = Partner.find(params[:user_id])
	  @favorite = Favorite.create(user: @user, partner: @partner)
    # @favorite.partner_id = params[:partner_id]
    # @favorite.user = current_user
    @favorite.save!
    redirect_back(fallback_location: root_path)
  end

	def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    # if params[:controller] == "partners"
    redirect_back(fallback_location: root_path)
  end
end

