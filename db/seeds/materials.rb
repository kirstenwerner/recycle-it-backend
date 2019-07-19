conn = Faraday.new(
  url: "http://api.earth911.com"
)

resp = conn.get("/earth911.getMaterials") do |req|
  req.params["api_key"] = "bce31bab12e1c92c"
end

materials = JSON.parse(resp.body)["result"]

materials.each do |material|
  Material.create!(
    name: material["description"],
    description: material["long_description"]
  )
end
