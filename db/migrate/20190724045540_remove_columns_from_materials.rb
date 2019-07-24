class RemoveColumnsFromMaterials < ActiveRecord::Migration[5.2]
  def change
    remove_column :materials, :created_at, :datetime
    remove_column :materials, :updated_at, :datetime
  end
end
