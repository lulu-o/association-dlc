class PartnersController < ApplicationController
  before_action :authorize, only: %i[ new create edit update ]
  before_action :set_partner, only: %i[ show edit update ]

  def index

    if params[:place].nil? || params[:place].empty?
      current_user.latitude.nil? ? @place = current_user.zipcode : @place = current_user.full_address
    else
      @place = params[:place]
      Geocoder.search(@place)[0].nil? ? @place = "Nantes" : @place = params[:place]
    end
    # Si pas de radius renseigné, on demande 10 km
    params[:radius] = 10 if params[:radius].to_i == 0
    @radius = params[:radius].to_i
    # Demander à Geocoder de remonter le résultat le plus pertinent (index 0)
    @place_coord = Geocoder.search(@place)[0].data
    # Remonter tous les partenaires autour de ce lieu
    @partners = Partner.near(@place, @radius)
    @partners.each do |partner|
      partner.distance = Geocoder::Calculations.distance_between([@place_coord["lat"], @place_coord["lon"]], [partner.latitude, partner.longitude]).truncate(1)
    end
    # Si aucun magasin n'est trouvé, on centre la carte sur l'endroit cherché avec un marker non cliquable
    if @partners.first.nil?
      @markers = [{lat: @place_coord["lat"], lng: @place_coord["lon"], i_window: "none"}]
    else
      @markers = @partners.geocoded.map do |partner|
        {
          lat: partner.latitude,
          lng: partner.longitude,
          infoWindow: render_to_string(partial: "partners/info_window", locals: { partner: partner })
        }
      end
    end

    # current_user.last_search = params[:place]
    # current_user.save
  end

  def show
    # @partner = Partner.find(params[:id])

    @is_favorite = Favorite.includes(:partner).where('user_id = ? AND partner_id = ?', current_user.id, @partner.id)
    if @is_favorite.blank?
      # @is_favorite = Favorite.new
    else
      @is_favorite = Favorite.includes(:partner).where('user_id = ? AND partner_id = ?', current_user.id, @partner.id)
    end

    @markers = [{ lat: @partner.latitude, lng: @partner.longitude, i_window: "none" }]
    @harvests = Harvest.where('date >= ?', DateTime.now).where(partner: @partner.id).order(:date)
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    @partner.save
    redirect_to_partner_path(@partner)
  end

  def edit
    # @partner = Partner.find(params[:id])
  end

  def update
    # @partner = Partner.find(params[:id])
    @partner.save
    redirect_to_partner_path(@partner)
  end

  private
    def authorize
      @user = current_user
      redirect_to unauthorized_path unless @user.admin
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:name, :address, :zipcode, :city)
    end
end
