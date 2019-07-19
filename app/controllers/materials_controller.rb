class MaterialsController < ApplicationController

  def index
    conn = Faraday.new(
      url: "http://api.earth911.com"
    )

    resp = conn.get("/earth911.getMaterials") do |req|
      req.params["api_key"] = "bce31bab12e1c92c"
    end

    render json: JSON.parse(resp.body)
  end

end
