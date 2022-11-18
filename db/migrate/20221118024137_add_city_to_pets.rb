class AddCityToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :city, :string
  end
end
