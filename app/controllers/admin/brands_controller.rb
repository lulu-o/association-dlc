module Admin
  class BrandsController < ApplicationController
    before_action :authorize, only: %i[ new create edit update destroy ]
    before_action :set_brand, only: %i[ edit update destroy]

    def new
      @brand = Brand.new
    end

    def create
      @brand = Brand.new(partner_params)
      @brand.save
      redirect_to admin_index_path
    end

    def edit
      set_brand
    end

    def update
      set_brand
      @brand.save
      redirect_to admin_index_path
    end

    def destroy
      set_brand
      @brand.destroy
      redirect_to admin_index_path
    end

    private


    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:brand).permit(:name, :logo)
    end

    def authorize
      @user = current_user
      redirect_to user_path('me') unless @user.admin
    end

  end

end
