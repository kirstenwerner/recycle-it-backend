class RecycleCenter < ActiveRecord::Migration[5.2]
  def change
    create_table :recycle_centers do |t|
      t.string :name
      t.float :longitude
      t.float :latitude
      t.string :location_id
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :phone_number
      t.string :hours 
    end
  end
end
