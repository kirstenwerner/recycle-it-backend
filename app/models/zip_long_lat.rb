class ZipLongLat < ApplicationRecord

  def self.get_lat_long(location)
    conn = Faraday.new(
      url: URI.parse("http://api.earth911.com")
    )

    resp = conn.get("earth911.getPostalData") do |req|
      req.params["api_key"] = "bce31bab12e1c92c"
      req.params["country"] = "US"
      req.params["postal_code"] = location
    end

    @api_response = JSON.parse(resp.body)

    return @api_response
  end

  
end
