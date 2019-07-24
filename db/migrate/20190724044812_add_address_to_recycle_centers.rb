class AddAddressToRecycleCenters < ActiveRecord::Migration[5.2]
  def change
    add_column :recycle_centers, :address, :string
  end
end
