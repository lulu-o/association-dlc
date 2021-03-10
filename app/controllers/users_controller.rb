class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def show
    @user = User.find(params[:id])
    @harvesters = Harvester.where("user_id = ?", current_user.id)
  end
end
