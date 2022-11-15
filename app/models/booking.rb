class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :pets, presence: true, uniqueness: { scope: :users }
end
