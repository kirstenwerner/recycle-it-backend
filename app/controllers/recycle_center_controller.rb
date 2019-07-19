class RecycleCenterController < ApplicationController


  def index
    conn = Faraday.new(
      url: "http://api.earth911.com"
    )

    resp = conn.get("/earth911.searchLocations") do |req|
      req.params["api_key"] = "bce31bab12e1c92c"
      req.params["latitude"] = 47.60
      req.params["longitude"] = -122.33
    end

    render json: JSON.parse(resp.body)
  end

end
