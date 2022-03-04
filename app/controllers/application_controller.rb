class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def default_url_options
  { host: ENV["www.association-dlc.org"] || "localhost:3000" }
  end

  private

end
