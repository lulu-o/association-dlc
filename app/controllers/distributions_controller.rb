class DistributionsController < ApplicationController
	def new
    @distribution = Distribution.new # needed to instantiate the form_for
  end

  def create
    @distribution = Distribution.new(params[:distribution])
    @distribution.save
  end
end
