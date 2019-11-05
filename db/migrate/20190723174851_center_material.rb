class CenterMaterial < ActiveRecord::Migration[5.2]
  def change
    create_table :center_material do |t|
      t.integer :recycle_center_id
      t.integer :material_id
    end 
  end
end
