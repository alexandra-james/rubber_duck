class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ducks, dependent: :destroy
  has_many :bookings, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  # validates :first_name, presence: true, length: { maximum: 20 }
  # validates :last_name, presence: true, length: { maximum: 20 }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
