class PartnersController < ApplicationController
  # before_action :set_partner, only: %i[ index show edit update destroy ]

  def index
    # VERIFIER LE PARAM LIEU :
    # 1 : Geocoding ne retrouve pas l'adresse => on prend le zipcode
    # 2 : Geocoding OK mais pas de lieu demandé => on prend l'adresse du user
    # 3 : Lieu renseigné => on fait la recherche sur ce lieu
    if params[:place].nil? || params[:place].empty?
      current_user.latitude.nil? ? @place = current_user.zipcode : @place = current_user.full_address
    else
      @place = params[:place]
    end
    # Si pas de radius renseigné, on demande 20 km
    params[:radius].to_i == 0 ? @radius = 20 : @radius = params[:radius].to_i
    @place_coord = Geocoder.search(@place)[0].data
    @partners = Partner.near(@place, @radius)
    # Si aucun magasin n'est trouvé, on centre la carte sur l'endroit cherché avec un marker non cliquable
    if @partners.first.nil?
      @markers = [{lat: @place_coord["lat"], lng: @place_coord["lon"], found: "none"}]
    else
      @markers = @partners.geocoded.map do |partner|
        {
          lat: partner.latitude,
          lng: partner.longitude,
          infoWindow: render_to_string(partial: "partners/info_window", locals: { partner: partner })
        }
      end
    end
  end

  def show

    # raise
    @partner = Partner.find(params[:id])

    @is_favorite = Favorite.includes(:partner).where('user_id = ? AND partner_id = ?', current_user.id, @partner.id)
    if @is_favorite.blank? 
      # @is_favorite = Favorite.new 
    else
      @is_favorite = Favorite.includes(:partner).where('user_id = ? AND partner_id = ?', current_user.id, @partner.id)
    end


    @markers = [{ lat: @partner.latitude, lng: @partner.longitude }]
    @harvests = Harvest.where('date >= ?', DateTime.now).where(partner: @partner.id).order(:date)
    # raise
  end

  def new
    @partner = Partner.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_partner
    #   @partner = Partner.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:name, :address, :zipcode, :city)
    end
end
