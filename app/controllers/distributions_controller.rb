class DistributionsController < ApplicationController
	def new
    @distribution = Distribution.new # needed to instantiate the form_for
    my_harvests_to_distribute = <<~SQL
      SELECT harvests.id, harvests.date, partners.name FROM harvests
      INNER JOIN harvesters ON harvesters.harvest_id = harvests.id
      INNER JOIN partners ON partners.id = harvests.partner_id
      WHERE harvesters.user_id = ? AND (harvests.date BETWEEN ? AND ?)
      ORDER BY harvests.date
    SQL
    @harvests = Harvest.find_by_sql([my_harvests_to_distribute, current_user.id, Date.today - 2.days, Date.today])

    @user = User.find_by_id(current_user.id)
  end

  def create
    @distribution = Distribution.new(params[:id])
    if @distribution.save
      redirect_to new_user_session_path
    else
      render :new
    end
  end

  def edit
    @distribution = Distribution.find(params[:id])
  end

  def update
    @distribution = Distribution.find(params[:id])
    @distribution.update(distribution_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to distribution_path(@distribution)
  end


private

  def distribution_params
      params.require(:distribution).permit(:date, :hour, :address, :zipcode, :city, :baskets_number, :description, :need_bag, :need_cooler, :informations)
  end
end
