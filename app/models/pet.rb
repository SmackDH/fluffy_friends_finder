
class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  include PgSearch::Model

  # pg_search_scope :date_between, against: [ :start, :end ]
  pg_search_scope :global_search, against: [ :name, :species ],
   associated_against: {user: [ :username] #=> Change this to "user's name"-key when added.
    },
     using: {
      tsearch: { prefix: true }
    }
end
