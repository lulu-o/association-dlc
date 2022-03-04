class UsersController < ApplicationController
  before_action :set_user, only: %i[ edit update destroy]

  def show
    @target = params[:target]
    @user = User.find_by_id(current_user.id)
    @harvesters = Harvester.includes(:harvest).where("user_id = ? AND harvests.date >= ?", current_user.id, DateTime.current.to_date).order('harvests.date')
    @distributions = Distribution.where(user: current_user).order(:date, :hour).where('date >= ?', DateTime.current.to_date)
    @past_distributions = Distribution.where(user: current_user).order(:date, :hour).where('date BETWEEN ? AND ?', Date.today - 2.weeks, Date.today)
  end

  def edit
    set_user
  end

  def update
    set_user
    @user.update(user_params)
    redirect_to admin_index_path
  end

  private
  def authorize
  @user = current_user
  redirect_to unauthorized_path unless @user.admin
end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :zipcode, :city)
  end

end
