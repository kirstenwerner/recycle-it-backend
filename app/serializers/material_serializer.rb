class MaterialSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :material_id
end
