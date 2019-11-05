class RecycleCentersController < ApplicationController


  def index
    @recycle_centers = RecycleCenter.return_recycle_centers
    render json: @recycle_centers
  end

end
