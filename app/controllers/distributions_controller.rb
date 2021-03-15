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
    @distribution = Distribution.new(params[:distribution])
    @distribution.save
  end
end
