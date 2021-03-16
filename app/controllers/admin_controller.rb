class AdminController < ApplicationController
  def index
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
      GROUP BY harvests.date, harvests.id
      ORDER BY harvests.date
      SQL


    @harvests = Harvest.find_by_sql(urgent_harvests_query).group_by(&:date)


    non_distributed_harvests = <<~SQL
      SELECT
        harvests.id AS id,
        harvests.date AS date,
        harvests.hour AS hour,
        harvests.partner_id AS partner_id
      FROM harvests
      WHERE harvests.id NOT IN (SELECT distinct(distributions.harvest_id) FROM distributions)
      SQL


    @non_distributed_harvests = Harvest.find_by_sql(non_distributed_harvests).group_by(&:date)


    @users = User.all

    @partners = Partner.all
  end
end







