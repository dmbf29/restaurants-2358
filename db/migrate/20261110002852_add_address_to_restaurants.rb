class AddAddressToRestaurants < ActiveRecord::Migration[8.1]
  def change
    # add_column :table_name, :column_name, :data_type
    add_column :restaurants, :address, :string
  end
end
