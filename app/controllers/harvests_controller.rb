class HarvestsController < ApplicationController
  def index
    # @harvests = Harvest.joins(:partner).where('date >= ?', DateTime.now).order(:date)
    urgent_harvests_query = <<~SQL
      WITH harvesters_count AS
      (SELECT harvest_id AS id, count(id) AS compteur FROM harvesters GROUP BY harvesters.harvest_id ORDER BY compteur DESC)
      SELECT
          harvests.id,
          harvests.date,
          harvests.hour,
          harvests.partner_id,
          harvests.harvesters_number
      FROM harvests
      LEFT OUTER JOIN harvesters_count ON harvesters_count.id = harvests.id
      WHERE (harvesters_count.compteur < harvests.harvesters_number OR harvesters_count.id IS NULL)
      AND harvests.date >= NOW()
      GROUP BY harvests.date, harvests.id
      ORDER BY harvests.date
      SQL

      @harvests = Harvest.find_by_sql(urgent_harvests_query).group_by(&:date)

  end

  def show
    @harvest = Harvest.includes(:harvesters).find(params[:id])
  end

  def update
    @user = current_user
    @harvest = Harvest.find(params[:id])

  end

  def send_notif
     @users = User.all
     @users.each { |user| user.send_emergency_email }
     redirect_to harvests_path, notice: "Notifications envoyées !"
  end

end



