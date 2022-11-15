class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pet, null: false, foreign_key: true
      t.integer :status, default: 0
      t.date :date_start
      t.date :date_end

      t.timestamps
      has_many :pets
      has_many :users
      validates :pets, presence: true, uniqueness: { scope: :users }
    end
  end
end
