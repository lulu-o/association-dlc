module Admin
  class AssociationsController < ApplicationController
    before_action :authorize, only: %i[ new create edit update destroy ]
    before_action :set_association, only: %i[ edit update destroy]

    def new
      @association = Association.new
    end

    def create
      @association = Association.new(association_params)
      @association.save
      redirect_to admin_index_path
    end

    def edit
      set_association
    end

    def update
      set_association
      @association.update(association_params)
      redirect_to admin_index_path
    end

    def destroy
      set_association
      @association.destroy
      redirect_to admin_index_path
    end

    private
    def authorize
      @user = current_user
      redirect_to user_path('me') unless @user.admin
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_association
      @association = Association.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def association_params
      params.require(:association).permit(:name, :address, :zipcode, :city)
    end

  end
end