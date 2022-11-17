class ChangeColumnDefaultForAvailable < ActiveRecord::Migration[7.0]
  def change
    change_column :pets, :available, :boolean, defaut: false
  end
end
