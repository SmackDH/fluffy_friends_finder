class AddStartAndEndToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :start, :date
    add_column :pets, :end, :date
  end
end
