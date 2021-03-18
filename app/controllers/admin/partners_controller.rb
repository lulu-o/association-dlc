module Admin
  class PartnersController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :home ]

    def new
      @partner = Partner.new
    end

  end
end
