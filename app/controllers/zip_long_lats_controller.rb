class ZipLongLatsController < ApplicationController

  def create
    response = ZipLongLat.get_lat_long(params[:location])

    @location = ZipLongLat.where(:zip_code => params[:location], :longitude => response["result"]["longitude"], :latitude => response["result"]["latitude"]).first_or_create

    @recycle_centers = RecycleCenter.search_centers(@location, params[:material][:id])

    render json: @recycle_centers
  end
end
