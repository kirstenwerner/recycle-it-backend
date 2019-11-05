class AddColumnToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_column :materials, :material_id, :integer
  end
end
