module Admin
  class UsersController < ApplicationController
    before_action :authorize, only: %i[ new create edit update destroy ]
    before_action :set_user, only: %i[ edit update destroy]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.save
      redirect_to admin_index_path
    end

    def edit
      set_user
    end

    def update
      set_user
      @user.update(user_params)
      redirect_to admin_index_path
    end

    def destroy
      set_association
      @user.destroy
      redirect_to admin_index_path
    end

    private
    def authorize
      @user = current_user
      redirect_to user_path('me') unless @user.admin
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :address, :zipcode, :city)
    end

  end
end