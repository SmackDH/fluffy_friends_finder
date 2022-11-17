class ChangePetsAvailableDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:pets, :available, true)
  end
end
