class PartnersController < ApplicationController
  before_action :set_partner, only: %i[ show edit update destroy ]

  def index
    # @place = params[:place]
    # @radius = params[:radius].to_i
    # @partners = Partner.near(@place, @radius)
    # # Si aucun magasin n'est trouvé, on centre la carte sur l'endroit cherché avec un marker non cliquable
    # if @partners.first.nil?
    #   @place_data = Geocoder.search(@place)[0].data
    #   @markers = [{lat: @place_data["lat"], lng: @place_data["lon"], found: "none"}]
    # else
    #   @markers = @partners.geocoded.map do |partner|
    #     {
    #       lat: partner.latitude,
    #       lng: partner.longitude,
    #       infoWindow: render_to_string(partial: "partners/info_window", locals: { partner: partner })
    #     }
    #   end
    # end
  end

  def show
    @partner = Partner.find(params[:id])
    @markers = [{ lat: @partner.latitude, lng: @partner.longitude }]
  end

  def new
    @partner = Partner.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:name, :address, :zipcode, :city)
    end
end
