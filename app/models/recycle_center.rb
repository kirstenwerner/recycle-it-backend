class RecycleCenter < ApplicationRecord
  has_many :center_materials
  has_many :materials, through: :center_materials

  def self.search_centers(location, material)
    conn = Faraday.new(
      url: URI.parse("http://api.earth911.com")
    )

    resp = conn.get("earth911.searchLocations") do |req|
      req.params["api_key"] = "bce31bab12e1c92c"
      req.params["latitude"] = location.latitude
      req.params["longitude"] = location.longitude
      req.params["material_id"] = material
    end

    @api_response = JSON.parse(resp.body)

    self.create_recycle_centers(@api_response["result"])

    return @recycle_centers
  end

  def self.create_recycle_centers(array)
    @recycle_centers = []

    array.each do |center|
      recycle_center = RecycleCenter.create!(
        name: center["description"],
        longitude: center["longitude"],
        latitude: center["latitude"],
        location_id: center["location_id"]
      )
      @recycle_centers.push(recycle_center)
    end

    # RecycleCenter.fill_in_center_details(@recycle_centers)
  end

  def self.get_recycle_center_details(center)
      conn = Faraday.new(
        url: URI.parse("http://api.earth911.com")
      )

      resp = conn.get("earth911.getLocationDetails") do |req|
        req.params["api_key"] = "bce31bab12e1c92c"
        req.params["location_id"] = center["location_id"]
    end

    @api_response = JSON.parse(resp.body)
  end

  def self.fill_in_center_details(array)
    @recycle_centers.each do |center|
      center_details = RecycleCenter.get_recycle_center_details(center)

      center.address = center_details["result"][center.location_id]["address"]
      center.zip_code = center_details["result"][center.location_id]["postal_code"]
      center.city = center_details["result"][center.location_id]["city"]
      center.state = center_details["result"][center.location_id]["province"]
      center.phone_number = center_details["result"][center.location_id]["phone"]
      center.hours = center_details["result"][center.location_id]["hours"]

      center.save
    end
  end

  def self.return_recycle_centers
    return @recycle_centers
  end

end
