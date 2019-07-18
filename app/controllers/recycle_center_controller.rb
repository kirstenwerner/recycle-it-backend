class RecycleCenterController < ApplicationController


  def index
    conn = Faraday::Connection.new 'https://data.wprdc.org/dataset/10dd50cf-bf29-4268-83e2-debcacea7885/resource/cdb6c800-3213-4190-8d39-495e36300263/download/wasterecoveryimg.geojson'
    @recycle_center = conn.get ''
    render json: JSON.parse(@recycle_center.body)
  end

end
