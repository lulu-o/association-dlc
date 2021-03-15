class UserMailer < ApplicationMailer

  def emergency
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

    @harvests = Harvest.find_by_sql Arel.sql(urgent_harvests_query)
    @user = params[:user] # Instance variable => available in view
    mail(to: "lucrecegugelot@gmail.com", subject: 'Récoltes urgentes')

    # This will render a view in `app/views/user_mailer`!
  end

end
