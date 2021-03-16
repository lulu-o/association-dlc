class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def show
    @user = User.find(params[:id])
    @harvesters = Harvester.where("user_id = ?", current_user.id)
    @distributions = Distribution.where("user_id = ?", current_user.id).order(:date, :hour).where('date >= ?', DateTime.current.to_date)

    @past_distributions = Distribution.where("user_id = ?", current_user.id).order(:date, :hour).where('date BETWEEN ? AND ?', Date.today - 2.weeks, Date.today)

  end
end
