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
      ORDER BY harvests.date
      SQL

      @harvests = Harvest.find_by_sql Arel.sql(urgent_harvests_query)

    # Retrieve harvests needing people - to be joined with upper query
    # Facon degueulasse
    # @emergency_harvest = Harvest.all.select do |harvest|
    #   harvest.harvesters_number > harvest.harvesters.count
    # end
    # Facon plus propre ne fonctionne pas - a creuser
    # Harvest.where('harvesters_number > harvesters.count')
  end
end





