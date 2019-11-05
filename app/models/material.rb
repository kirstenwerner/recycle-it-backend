class Material < ApplicationRecord
  has_many :center_materials
  has_many :recycle_centers, through: :center_materials
end
