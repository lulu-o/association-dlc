module Admin
  class PartnersController < ApplicationController
    before_action :authorize, only: %i[ new create edit update destroy ]
    before_action :set_partner, only: %i[ edit update destroy]

    def new
      @partner = Partner.new
    end

    def create
      @partner = Partner.new(partner_params)
      @partner.save
      redirect_to admin_index_path
    end

    def edit
      set_partner
    end

    def update
      set_partner
      @partner.save
      redirect_to admin_index_path
    end

    def destroy
      set_partner
      @partner.destroy
      redirect_to admin_index_path
    end

    private


    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:name, :address, :zipcode, :city, :brand_id)
    end

    def authorize
      @user = current_user
      redirect_to user_path('me') unless @user.admin
    end

  end

  end
