class Duck < ApplicationRecord
  LANGUAGES = ["Ruby", "JavaScript", "Python", "Go", "Java", "Rust",
               "C", "C++", "C#", "PHP", "TypeScript", "Swift", "Dart"]

  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :image_url, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_title_and_langurage,
    against: [ :name, :language ],
    associated_against: {
      user: [:location]
    },
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
