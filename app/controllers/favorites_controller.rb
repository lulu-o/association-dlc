class FavoritesController < ApplicationController
	def index
		# @favorites = Favorite.all
    @favorites = Favorite.where("user_id = ?", current_user.id)
	end
end
