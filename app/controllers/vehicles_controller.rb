class VehiclesController < ApplicationController
  def index
    @vehicle = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      logger.debug "Vehicle created"
    else
      logger.debug "Vehicle creation failed"
  end
end


  private

  def vehicle_params
    params.require(:vehicle).permit(:name, :market_id)
  end
end
