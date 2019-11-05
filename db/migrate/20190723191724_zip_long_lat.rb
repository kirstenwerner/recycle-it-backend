class ZipLongLat < ActiveRecord::Migration[5.2]
  def change
    create_table :zip_long_lats do |t|
      t.string :zip_code
      t.float :longitude
      t.float :latitude
    end 
  end
end
