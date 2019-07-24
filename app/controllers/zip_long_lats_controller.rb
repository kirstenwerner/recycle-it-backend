class ZipLongLatsController < ApplicationController

  def create
    response = ZipLongLat.get_lat_long(params[:location])

    @location = ZipLongLat.create(zip_code: params[:location], longitude: response["result"]["longitude"], latitude: response["result"]["latitude"])

    @recycle_centers = RecycleCenter.search_centers(@location, params[:material][:id])

    render json: @recycle_centers
  end
end
