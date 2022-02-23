class DistributionsController < ApplicationController

  def show
    @distribution = Distribution.find(params[:id])
  end

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
    my_harvests_to_distribute = <<~SQL
      SELECT harvests.id, harvests.date, partners.name FROM harvests
      INNER JOIN harvesters ON harvesters.harvest_id = harvests.id
      INNER JOIN partners ON partners.id = harvests.partner_id
      WHERE harvesters.user_id = ? AND (harvests.date BETWEEN ? AND ?)
      ORDER BY harvests.date
    SQLcu
    @user = current_user
    @harvests = Harvest.find_by_sql([my_harvests_to_distribute, current_user.id, Date.today - 2.days, Date.today])
    @user = User.find_by_id(current_user.id)
    harvest = Harvest.find(params[:distribution][:harvest])
    @distribution = Distribution.new(distribution_params)
    @distribution.user = @user
    @distribution.harvest = harvest
    if @distribution.save!
      params[:target] = "distributions"
      redirect_to user_path(@user, target: params[:target])
    else
      render :new
    end
  end

  def edit
    @distribution = Distribution.find(params[:id])
    my_harvests_to_distribute = <<~SQL
      SELECT harvests.id, harvests.date, partners.name FROM harvests
      INNER JOIN harvesters ON harvesters.harvest_id = harvests.id
      INNER JOIN partners ON partners.id = harvests.partner_id
      WHERE harvesters.user_id = ? AND (harvests.date BETWEEN ? AND ?)
      ORDER BY harvests.date
    SQL
    @harvests = Harvest.find_by_sql([my_harvests_to_distribute, current_user.id, Date.today - 2.days, Date.today])
  end

  def update
    @distribution = Distribution.find(params[:id])
    @distribution.update(distribution_params)

    redirect_to distribution_path(@distribution)
  end


private

  def distribution_params
      params.require(:distribution).permit(:date, :hour, :address, :zipcode, :city, :baskets_number, :description, :need_bag, :need_cooler, :informations, :user)
  end
end
