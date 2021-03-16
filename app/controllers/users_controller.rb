class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def show
    @user = User.find(params[:id])
    # @harvesters = Harvester.where("user_id = ?", current_user.id)
    # @harvesters = Harvest.includes(:harvesters).where( harvesters: {user: current_user}).order(:date) 
    @harvesters = Harvester.includes(:harvest).where("user_id = ? AND harvests.date >= ?", current_user.id, DateTime.current.to_date).order('harvests.date') 

    
    @distributions = Distribution.where("user_id = ?", current_user.id).order(:date, :hour).where('date >= ?', DateTime.current.to_date)

    @past_distributions = Distribution.where("user_id = ?", current_user.id).order(:date, :hour).where('date BETWEEN ? AND ?', Date.today - 2.weeks, Date.today)

  end
end
