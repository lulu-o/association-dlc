class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :landingpage ]

  def home
  end

  def contact
  end

  def landingpage
  end
end
