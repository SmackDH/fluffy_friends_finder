
class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy

  include PgSearch::Model
  multisearchable against: [:name, :description]
  pg_search_scope :global_search, against: [ :name, :description ],
   associated_against: {user: [ :email, :username] #=> Change this to "user's name"-key when added.
    },
     using: {
      tsearch: { prefix: true }
    }
end
